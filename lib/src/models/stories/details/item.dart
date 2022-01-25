import 'package:insta_extractor/src/models/items/image_versions/image_versions2.dart';
import 'package:insta_extractor/src/models/items/video_version.dart';

class StoryItem {
  final List<VideoVersion>? videoVersions;
  final ImageVersions2? imageVersion;

  const StoryItem({this.imageVersion, this.videoVersions});

  factory StoryItem.fromJson(Map<String, dynamic> response) => StoryItem(
        imageVersion: response["image_versions2"] == null
            ? null
            : ImageVersions2.fromMap(response["image_versions2"]),
        videoVersions: response['video_versions'] == null
            ? null
            : (response['video_versions'] as List<dynamic>?)
                ?.map((e) => VideoVersion.fromMap(e as Map<String, dynamic>))
                .toList(),
      );
}
