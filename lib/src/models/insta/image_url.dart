import 'dart:convert';

class ImageUrl {
	String? url;

	ImageUrl({this.url});

	@override
	String toString() => 'ImageUrl(url: $url)';

	factory ImageUrl.fromMap(Map<String, dynamic> data) => ImageUrl(
				url: data['url'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'url': url,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ImageUrl].
	factory ImageUrl.fromJson(String data) {
		return ImageUrl.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [ImageUrl] to a JSON string.
	String toJson() => json.encode(toMap());
}
