import 'dart:convert';

import 'image_url.dart';
import 'user.dart';
import 'video_url.dart';

class Insta {
	User? user;
	List<VideoUrl>? videoUrls;
	List<ImageUrl>? imageUrls;

	Insta({this.user, this.videoUrls, this.imageUrls});

	@override
	String toString() {
		return 'Insta(user: $user, videoUrls: $videoUrls, imageUrls: $imageUrls)';
	}

	factory Insta.fromMap(Map<String, dynamic> data) => Insta(
				user: data['user'] == null
						? null
						: User.fromMap(data['user'] as Map<String, dynamic>),
				videoUrls: (data['video_urls'] as List<dynamic>?)
						?.map((e) => VideoUrl.fromMap(e as Map<String, dynamic>))
						.toList(),
				imageUrls: (data['image_urls'] as List<dynamic>?)
						?.map((e) => ImageUrl.fromMap(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toMap() => {
				'user': user?.toMap(),
				'video_urls': videoUrls?.map((e) => e.toMap()).toList(),
				'image_urls': imageUrls?.map((e) => e.toMap()).toList(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Insta].
	factory Insta.fromJson(String data) {
		return Insta.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Insta] to a JSON string.
	String toJson() => json.encode(toMap());
}
