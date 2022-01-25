import 'package:insta_extractor/src/utils/api_utils.dart';

class StoryUser {
  final int pk;
  final String username, fullname, profileUrl;

  const StoryUser(this.pk, this.username, this.fullname, this.profileUrl);

  factory StoryUser.fromJson(Map<String, dynamic> response) {
    int pk = response[ApiUtils.pk] as int;
    String username = response[ApiUtils.username].toString();
    String fullname = response[ApiUtils.fullName].toString();
    String profileUrl = response[ApiUtils.profileUrl].toString();

    return StoryUser(pk, username, fullname, profileUrl);
  }
}
