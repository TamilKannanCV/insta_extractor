import 'package:insta_extractor/src/utils/api_utils.dart';
import '../../../../insta_extractor.dart';

class StoryDetails {
  final ReelFeed reelFeed;
  final Owner owner;

  const StoryDetails(this.reelFeed, this.owner);

  factory StoryDetails.fromJson(Map<String, dynamic> response) {
    final owner = Owner.fromMap(response["user_detail"]["user"]);
    final reelFeed = ReelFeed.fromMap(response[ApiUtils.reelFeed]);
    return StoryDetails(reelFeed, owner);
  }
}
