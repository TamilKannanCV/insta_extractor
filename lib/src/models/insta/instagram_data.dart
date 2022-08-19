import 'dart:convert';

import 'image_url.dart';
import 'user.dart';
import 'video_url.dart';

class InstagramData {
  User? user;
  List<VideoUrl>? videoUrls;
  List<ImageUrl>? imageUrls;

  InstagramData({this.user, this.videoUrls, this.imageUrls});

  @override
  String toString() {
    return 'Insta(user: $user, videoUrls: $videoUrls, imageUrls: $imageUrls)';
  }

  factory InstagramData.fromMap(Map<String, dynamic> data) => InstagramData(
        user: data['user'] == null ? null : User.fromMap(data['user'] as Map<String, dynamic>),
        videoUrls: (data['video_urls'] as List<dynamic>?)?.map((e) => VideoUrl.fromMap(e as Map<String, dynamic>)).toList(),
        imageUrls: (data['image_urls'] as List<dynamic>?)?.map((e) => ImageUrl.fromMap(e as Map<String, dynamic>)).toList(),
      );

  Map<String, dynamic> toMap() => {
        'user': user?.toMap(),
        'video_urls': videoUrls?.map((e) => e.toMap()).toList(),
        'image_urls': imageUrls?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [InstagramData].
  factory InstagramData.fromJson(String data) {
    return InstagramData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [InstagramData] to a JSON string.
  String toJson() => json.encode(toMap());
}
