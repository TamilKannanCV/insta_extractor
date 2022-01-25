import 'dart:convert';

class Candidate {
	int? width;
	int? height;
	String? url;

	Candidate({this.width, this.height, this.url});

	factory Candidate.fromMap(Map<String, dynamic> data) => Candidate(
				width: data['width'] as int?,
				height: data['height'] as int?,
				url: data['url'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'width': width,
				'height': height,
				'url': url,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Candidate].
	factory Candidate.fromJson(String data) {
		return Candidate.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Candidate] to a JSON string.
	String toJson() => json.encode(toMap());
}
