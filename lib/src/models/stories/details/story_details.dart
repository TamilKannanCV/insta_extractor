
import 'package:insta_extractor/src/utils/api_utils.dart';

import 'reel_feed.dart';

class StoryDetails {
  final ReelFeed reelFeed;

  const StoryDetails(this.reelFeed);

  factory StoryDetails.fromJson(Map<String, dynamic> response) {
    ReelFeed reelFeed = ReelFeed.fromJson(response[ApiUtils.reelFeed]);
    return StoryDetails(reelFeed);
  }
}
