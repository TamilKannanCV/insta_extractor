import 'dart:convert';

class VideoVersions {
	int? type;
	int? width;
	int? height;
	String? url;
	String? id;

	VideoVersions({this.type, this.width, this.height, this.url, this.id});

	factory VideoVersions.fromMap(Map<String, dynamic> data) => VideoVersions(
				type: data['type'] as int?,
				width: data['width'] as int?,
				height: data['height'] as int?,
				url: data['url'] as String?,
				id: data['id'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'type': type,
				'width': width,
				'height': height,
				'url': url,
				'id': id,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [VideoVersions].
	factory VideoVersions.fromJson(String data) {
		return VideoVersions.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [VideoVersions] to a JSON string.
	String toJson() => json.encode(toMap());
}
