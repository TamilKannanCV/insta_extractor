import 'dart:convert';

class VideoUrl {
	String? url;
	String? previewImage;

	VideoUrl({this.url, this.previewImage});

	@override
	String toString() => 'VideoUrl(url: $url, previewImage: $previewImage)';

	factory VideoUrl.fromMap(Map<String, dynamic> data) => VideoUrl(
				url: data['url'] as String?,
				previewImage: data['preview_image'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'url': url,
				'preview_image': previewImage,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [VideoUrl].
	factory VideoUrl.fromJson(String data) {
		return VideoUrl.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [VideoUrl] to a JSON string.
	String toJson() => json.encode(toMap());
}
