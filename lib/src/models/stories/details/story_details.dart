import 'package:insta_extractor/src/utils/api_utils.dart';
import '../../../../insta_extractor.dart';

class StoryDetails {
  final Feed feed;
  final Owner owner;

  const StoryDetails(this.feed, this.owner);

  factory StoryDetails.fromMap(Map<String, dynamic> response) {
    final _owner = Owner.fromMap(response["user_detail"]["user"]);
    final _feed = Feed.fromMap(response[ApiUtils.feed]);
    return StoryDetails(_feed, _owner);
  }
}
