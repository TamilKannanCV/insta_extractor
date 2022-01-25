import 'dart:convert';

import 'candidate.dart';

class ImageVersions2 {
  List<Candidate>? candidates;

  ImageVersions2({this.candidates});

  factory ImageVersions2.fromMap(Map<String, dynamic> data) {
    return ImageVersions2(
      candidates: (data['candidates'] as List<dynamic>?)
          ?.map((e) => Candidate.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'candidates': candidates?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ImageVersions2].
  factory ImageVersions2.fromJson(String data) {
    return ImageVersions2.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ImageVersions2] to a JSON string.
  String toJson() => json.encode(toMap());
}
