import 'dart:convert';

class VideoVersion {
  int? type;
  int? width;
  int? height;
  String? url;
  String? id;

  VideoVersion({this.type, this.width, this.height, this.url, this.id});

  factory VideoVersion.fromMap(Map<String, dynamic> data) => VideoVersion(
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
  /// Parses the string and returns the resulting Json object as [VideoVersion].
  factory VideoVersion.fromJson(String data) {
    return VideoVersion.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [VideoVersion] to a JSON string.
  String toJson() => json.encode(toMap());
}
