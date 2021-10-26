import 'package:insta_extractor/src/utils/api_utils.dart';
import 'story_content.dart';

class ImageVersion {
  final List<StoryContent>? storyContent;

  const ImageVersion(this.storyContent);

  factory ImageVersion.fromJson(Map<String, dynamic> response) {
    List<StoryContent> contents = List.empty(growable: true);
    for (var data in (response[ApiUtils.candidates] as List<dynamic>)) {
      contents.add(StoryContent.fromJson(data));
    }
    return ImageVersion(contents);
  }
}
