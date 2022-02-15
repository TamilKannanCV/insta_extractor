import 'package:insta_extractor/src/utils/api_utils.dart';

import 'item.dart';

class Feed {
  final List<StoryItem> items;

  const Feed(this.items);

  factory Feed.fromMap(Map<String, dynamic> response) {
    List<StoryItem> items = List.empty(growable: true);
    for (var data in (response[ApiUtils.items] as List<dynamic>)) {
      items.add(StoryItem.fromJson(data));
    }

    return Feed(items);
  }
}
