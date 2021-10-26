import 'package:insta_extractor/src/utils/api_utils.dart';

class User {
  final String fullName;
  final String? profileUrl;
  final String? username;

  const User(this.fullName, {this.username, this.profileUrl});

  factory User.fromJson(Map<String, dynamic> response) {
    String fullName = response[ApiUtils.fullName].toString();
    String profileUrl = response[ApiUtils.profileUrl].toString();
    String userName = response[ApiUtils.username].toString();
    return User(fullName, profileUrl: profileUrl, username: userName);
  }
}
