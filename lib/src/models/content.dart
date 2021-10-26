import 'package:insta_extractor/src/utils/api_utils.dart';

class Content {
  final String? displayUrl;
  final bool isVideo;
  final String? videoUrl;

  const Content(this.isVideo, this.displayUrl, {this.videoUrl});

  factory Content.fromJson(Map<String, dynamic> response) {
    bool isVideo = response[ApiUtils.isVideo] as bool;
    String? videoUrl = response[ApiUtils.videoUrl].toString();
    String? displayUrl = response[ApiUtils.displayUrl].toString();

    return Content(isVideo, displayUrl, videoUrl: videoUrl);
  }
}
