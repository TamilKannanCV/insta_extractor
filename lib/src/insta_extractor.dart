import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'package:insta_extractor/src/models/insta/insta.dart';
import 'package:insta_extractor/src/utils/api_utils.dart';
import 'package:insta_extractor/src/utils/link_utils.dart';

class InstaExtractor {
  InstaExtractor._();

  static const _kUserId = "ds_user_id";
  static const _kSessionId = "sessionid";
  static const _kCsrftoken = "csrftoken";

  static final _i = InstaExtractor._();
  static InstaExtractor get i => _i;

  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox('app');
  }

  ///Sets the cookies into storage
  Future<void> setCookies({
    required String userId,
    required String sessionId,
    required String csrftoken,
  }) async {
    await Hive.box('app').put(_kUserId, userId);
    await Hive.box('app').put(_kSessionId, sessionId);
    await Hive.box('app').put(_kCsrftoken, csrftoken);
  }

  ///Returns the details of posts, reels, igtv and user story
  Future<Insta> getDetails(String link) async {
    final parsedLink = ParseLink.instagram(link);
    var client = RetryClient(Client());
    final box = Hive.box('app');
    Response response;

    response = await client.get(
      Uri.parse(ApiUtils.ENDPOINT).replace(
        queryParameters: {
          'url': parsedLink,
          'sessionId': box.get(_kSessionId),
          'userId': box.get(_kUserId),
          'status': LinkUtils.isStoryUrl(link) ? 1 : 0,
        },
      ),
    );
    client.close();
    log(response.body.toString());

    return Insta.fromJson(response.body);
  }
}
