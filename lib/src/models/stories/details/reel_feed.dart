import 'dart:developer';

import 'package:insta_extractor/src/utils/api_utils.dart';

import 'item.dart';

class ReelFeed {
  final List<StoryItem> items;

  const ReelFeed(this.items);

  factory ReelFeed.fromJson(Map<String, dynamic> response) {
    List<StoryItem> items = List.empty(growable: true);
    log(response[ApiUtils.items]);
    for (var data in (response[ApiUtils.items] as List<dynamic>)) {
      items.add(StoryItem.fromJson(data));
    }

    return ReelFeed(items);
  }
}
