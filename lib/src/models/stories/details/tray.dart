import 'package:insta_extractor/src/utils/api_utils.dart';

import '../story_user.dart';
import 'item.dart';

class Tray {
  final StoryUser user;
  final int mediaCount;
  final List<StoryItem> items;

  const Tray(this.user, this.mediaCount, this.items);

  factory Tray.fromJson(Map<String, dynamic> response) {
    StoryUser storyUser = StoryUser.fromJson(response[ApiUtils.user]);
    int mediaCount = response[ApiUtils.mediaCount] as int;
    List<StoryItem> items = List.empty(growable: true);
    for (var data in (response[ApiUtils.items] as List<dynamic>)) {
      items.add(StoryItem.fromJson(data));
    }

    return Tray(storyUser, mediaCount, items);
  }
}
