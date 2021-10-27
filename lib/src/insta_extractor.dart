import 'dart:convert';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'package:insta_extractor/src/models/graphql.dart';
import 'package:insta_extractor/src/utils/api_utils.dart';
import 'package:insta_extractor/src/utils/link_utils.dart';

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
    await GetStorage.init();
    await GetStorage().write(kUserId, userId);
    await GetStorage().write(kSessionId, sessionId);
    await GetStorage().write(kCsrftoken, csrftoken);
  }

  ///Returns the details of posts, reels, igtv
  static Future<Graphql> getDetails(String link) async {
    final parsedLink = ParseLink.instagram(link);
    var client = RetryClient(Client());
    Response response;
    try {
      response = await client.get(Uri.parse(parsedLink), headers: {
        ApiUtils.cookie: _generateCookie(),
        ApiUtils.userAgent: ApiUtils.USERAGENT
      });
    } on SocketException catch (e) {
      return Future.error(e);
    } finally {
      client.close();
    }

    return Graphql.fromJson(jsonDecode(response.body));
  }

  static Future<User> getUser() async {
    var client = RetryClient(Client());

    Response response;
    try {
      response = await client.get(Uri.parse(
          "https://instagram-unofficial-api.herokuapp.com/unofficial/api/profile?userid=" +
              _getString(kUserId)));

      String url =
          "https://www.instagram.com/${jsonDecode(response.body)[ApiUtils.user][ApiUtils.username]}/?__a=1";
      response = await client.get(Uri.parse(url), headers: {
        ApiUtils.cookie: _generateCookie(),
        ApiUtils.userAgent: ApiUtils.USERAGENT
      });
    } finally {
      client.close();
    }

    return User.fromJson(
        jsonDecode(response.body)[ApiUtils.graphql][ApiUtils.user]);
  }

  static Future<StoryDetails> getStories(String link) async {
    final username = LinkUtils.getUsername(link);
    var client = RetryClient(Client());

    Response response;
    try {
      response = await client.get(
          Uri.parse("https://i.instagram.com/api/v1/feed/reels_tray/"),
          headers: {
            ApiUtils.cookie: _generateCookie(),
            ApiUtils.userAgent: ApiUtils.STORY_USERAGENT
          });

      Story story = Story.fromJson(jsonDecode(response.body));
      Tray tray =
          story.trays.firstWhere((tray) => tray.user.username == username);

      response = await client.get(
          Uri.parse(
              "https://i.instagram.com/api/v1/users/${tray.user.pk}/full_detail_info/"),
          headers: {
            ApiUtils.cookie: _generateCookie(),
            ApiUtils.userAgent: ApiUtils.STORY_USERAGENT
          });
    } finally {
      client.close();
    }

    return StoryDetails.fromJson(jsonDecode(response.body));
  }

  static String _getString(String key) {
    return GetStorage().read(key) ?? '';
  }

  static String _generateCookie() {
    return "ds_user_id=${_getString("ds_user_id")}; sessionid=${_getString("sessionid")}";
  }
}
