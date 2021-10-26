

import 'package:insta_extractor/src/utils/api_utils.dart';

class Owner {
  final String username, fullname, profilePicUrl;

  const Owner(this.username, this.fullname, this.profilePicUrl);

  factory Owner.fromJson(Map<String, dynamic> data) {
    final _username = data[ApiUtils.username];
    final _fullname = data[ApiUtils.fullName];
    final _profilePicUrl = data[ApiUtils.profilePicUrl];

    return Owner(
      _username,
      _fullname,
      _profilePicUrl,
    );
  }
}
