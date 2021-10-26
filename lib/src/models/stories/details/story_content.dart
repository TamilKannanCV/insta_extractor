import 'package:insta_extractor/src/utils/api_utils.dart';

class StoryContent {
  final int width, height;
  final String url;

  const StoryContent(this.url, this.width, this.height);

  factory StoryContent.fromJson(Map<String, dynamic> response) {
    int height = response[ApiUtils.height] as int;
    int width = response[ApiUtils.width] as int;
    String url = response[ApiUtils.url].toString();

    return StoryContent(url, width, height);
  }
}
