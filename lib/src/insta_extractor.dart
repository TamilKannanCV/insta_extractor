import 'dart:developer';

import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'package:insta_extractor/src/models/insta/insta.dart';
import 'package:insta_extractor/src/utils/api_utils.dart';
import 'package:insta_extractor/src/utils/link_utils.dart';
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
    preferences.setString(_kUserId, userId);
    preferences.setString(_kUserId, userId);
    preferences.setString(_kSessionId, sessionId);
    preferences.setString(_kCsrftoken, csrftoken);
  }

  ///Returns the details of posts, reels, igtv and user story
  static Future<Insta> getDetails(String link) async {
    final parsedLink = ParseLink.instagram(link);
    var client = RetryClient(Client());
    Response response;

    response = await client.get(
      Uri.parse(ApiUtils.ENDPOINT).replace(
        queryParameters: {
          'url': parsedLink,
          'sessionId': await _getString(_kSessionId),
          'userId': await _getString(_kUserId),
          'status': LinkUtils.isStoryUrl(link) ? '1' : '0',
        },
      ),
    );
    client.close();
    log(response.body.toString());

    return Insta.fromJson(response.body);
  }

  static Future<String> _getString(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key) ?? '';
  }
}
