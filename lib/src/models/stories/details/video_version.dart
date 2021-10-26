
import 'package:insta_extractor/src/utils/api_utils.dart';

import 'story_content.dart';

class VideoVersion {
  final int type;
  final StoryContent storyContent;

  const VideoVersion(this.type, this.storyContent);

  factory VideoVersion.fromJson(Map<String, dynamic> response) {
    int type = response[ApiUtils.type] as int;
    StoryContent content = StoryContent.fromJson(response);

    return VideoVersion(type, content);
  }
}
