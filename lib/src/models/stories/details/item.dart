import 'package:insta_extractor/src/utils/api_utils.dart';

import 'video_version.dart';

import 'image_version.dart';

class StoryItem {
  final int mediaType;
  final List<VideoVersion>? videoVersions;
  final ImageVersion? imageVersion;

  const StoryItem(this.mediaType, {this.imageVersion, this.videoVersions});

  factory StoryItem.fromJson(Map<String, dynamic> response) {
    int mediaType = response[ApiUtils.mediaType] as int;
    List<VideoVersion>? videoVersions;
    ImageVersion? imageVersion;
    switch (mediaType) {
      case 1:
        imageVersion = ImageVersion.fromJson(response[ApiUtils.imageVersions2]);
        break;
      case 2:
        videoVersions = List.empty(growable: true);
        for (var data in (response[ApiUtils.videoVersions] as List<dynamic>)) {
          videoVersions.add(VideoVersion.fromJson(data));
        }
        break;
    }

    return StoryItem(mediaType,
        videoVersions: videoVersions, imageVersion: imageVersion);
  }
}
