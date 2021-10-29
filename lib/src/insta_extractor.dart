import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'package:insta_extractor/src/models/graphql.dart';
import 'package:insta_extractor/src/utils/api_utils.dart';
import 'package:insta_extractor/src/utils/link_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/stories/details/story_details.dart';
import 'models/stories/details/tray.dart';
import 'models/stories/story.dart';
import 'models/user.dart';

class InstaExtractor {
  static const kUserId = "ds_user_id";
  static const kSessionId = "sessionid";
  static const kCsrftoken = "csrftoken";

  ///Sets the cookies into storage
  static Future<void> setCookies({
    required String userId,
    required String sessionId,
    required String csrftoken,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(kUserId, userId);
    await preferences.setString(kSessionId, sessionId);
    await preferences.setString(kCsrftoken, csrftoken);
    log(userId + " - " + sessionId + " - " + csrftoken);
  }

  ///Returns the details of posts, reels, igtv
  static Future<Graphql> getDetails(String link) async {
    final parsedLink = ParseLink.instagram(link);
    var client = RetryClient(Client());
    Response response;
    try {
      response = await client.get(Uri.parse(parsedLink), headers: {
        ApiUtils.cookie: await generateCookie(),
        ApiUtils.userAgent: ApiUtils.USERAGENT
      });
    } on SocketException catch (e) {
      return Future.error(e);
    } finally {
      client.close();
    }

    return Graphql.fromJson(jsonDecode(response.body));
  }

  ///Returns [User] details like username, userid, profileUrl
  static Future<User> getUser() async {
    var client = RetryClient(Client());

    Response response;
    try {
      response = await client.get(Uri.parse(
          "https://instagram-unofficial-api.herokuapp.com/unofficial/api/profile?userid=" +
              await _getString(kUserId)));

      String url =
          "https://www.instagram.com/${jsonDecode(response.body)[ApiUtils.user][ApiUtils.username]}/?__a=1";
      response = await client.get(Uri.parse(url), headers: {
        ApiUtils.cookie: await generateCookie(),
        ApiUtils.userAgent: ApiUtils.USERAGENT
      });
    } finally {
      client.close();
    }

    return User.fromJson(
        jsonDecode(response.body)[ApiUtils.graphql][ApiUtils.user]);
  }

  ///Returns [StoryDetails] for the given link
  static Future<StoryDetails> getStories(String link) async {
    final username = LinkUtils.getUsername(link);
    log(username);
    var client = RetryClient(Client());

    Response response;
    try {
      response = await client.get(
          Uri.parse("https://i.instagram.com/api/v1/feed/reels_tray/"),
          headers: {
            ApiUtils.cookie: await generateCookie(),
            ApiUtils.userAgent: ApiUtils.STORY_USERAGENT
          });

      log(response.body);

      Story story = Story.fromJson(jsonDecode(response.body));
      log(story.trays.length.toString() + " Story passed");
      Tray tray =
          story.trays.firstWhere((tray) => tray.user.username == username);
      log(tray.items.length.toString() + " Tray passed");
      response = await client.get(
          Uri.parse(
              "https://i.instagram.com/api/v1/users/${tray.user.pk}/full_detail_info/"),
          headers: {
            ApiUtils.cookie: await generateCookie(),
            ApiUtils.userAgent: ApiUtils.STORY_USERAGENT
          });
    } finally {
      client.close();
    }

    log(response.body);

    return StoryDetails.fromJson(jsonDecode(response.body));
  }

  static Future<String> _getString(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key) ?? '';
  }

  static Future<String> generateCookie() async {
    final userId = await _getString(kUserId);
    final sessionId = await _getString(kSessionId);
    log(userId + " - " + sessionId);
    return "ds_user_id=$userId; sessionid=$sessionId";
  }
}
