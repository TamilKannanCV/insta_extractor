import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/retry.dart';
// import 'package:insta_extractor/ids.dart' as id;
import 'package:insta_extractor/insta_extractor.dart';
import 'package:insta_extractor/src/utils/api_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InstaExtractor {
  static const _kUserId = "ds_user_id";
  static const _kSessionId = "sessionid";
  static const _kCsrftoken = "csrftoken";

  ///Sets the cookies into storage
  static Future<void> setCookies({
    required String userId,
    required String sessionId,
    required String csrftoken,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(_kUserId, userId);
    await preferences.setString(_kSessionId, sessionId);
    await preferences.setString(_kCsrftoken, csrftoken);
    log(userId + " - " + sessionId + " - " + csrftoken);
  }

  ///Returns the details of posts, reels, igtv
  static Future<Item> getDetails(String link) async {
    final parsedLink = ParseLink.instagram(link);
    var client = RetryClient(Client());
    Response response;

    response = await client.get(Uri.parse(parsedLink), headers: {
      ApiUtils.cookie: await generateCookie(),
      ApiUtils.userAgent: ApiUtils.USERAGENT
    });
    client.close();
    log(response.body.toString());

    return Item.fromJson(response.body);
  }

  ///Returns [User] details like username, userid, profileUrl
  static Future<User> getUser() async {
    var client = RetryClient(Client());

    Response response;

    response = await client.get(Uri.parse(
        "https://instagram-unofficial-api.herokuapp.com/unofficial/api/profile?userid=" +
            await _getString(_kUserId)));

    String url =
        "https://www.instagram.com/${jsonDecode(response.body)[ApiUtils.user][ApiUtils.username]}/?__a=1";
    response = await client.get(Uri.parse(url), headers: {
      ApiUtils.cookie: await generateCookie(),
      ApiUtils.userAgent: ApiUtils.USERAGENT
    });

    client.close();

    return User.fromJson(
        jsonDecode(response.body)[ApiUtils.graphql][ApiUtils.user]);
  }

  ///Returns [StoryDetails] for the given link
  static Future<StoryDetails?> getStories(String link) async {
    final username = LinkUtils.getUsername(link);
    log(username);
    var client = RetryClient(Client());

    StoryDetails? _storyDetails;

    Response _response = await client.get(
      Uri.parse("https://i.instagram.com/api/v1/feed/reels_tray/"),
      headers: {
        ApiUtils.cookie: await generateCookie(),
        ApiUtils.userAgent: ApiUtils.STORY_USERAGENT
      },
    );

    Story story = Story.fromMap(jsonDecode(_response.body));

    Tray tray =
        story.trays.firstWhere((tray) => tray.user?.username == username);

    _response = await client.get(
        Uri.parse(
            "https://i.instagram.com/api/v1/users/${tray.user?.pk}/full_detail_info/"),
        headers: {
          ApiUtils.cookie: await generateCookie(),
          ApiUtils.userAgent: ApiUtils.STORY_USERAGENT
        });

    Owner owner =
        Owner.fromMap(json.decode(_response.body)["user_detail"]["user"]);

    _storyDetails = StoryDetails(owner, story.trays);

    client.close();

    return _storyDetails;
  }

  static Future<String> _getString(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key) ?? '';
  }

  static Future<String> generateCookie() async {
    // final userId = id.userId;
    // final sessionId = id.sessionId;
    final userId = await _getString(_kUserId);
    final sessionId = await _getString(_kSessionId);
    log(userId + " - " + sessionId);
    return "ds_user_id=$userId; sessionid=$sessionId";
  }
}
