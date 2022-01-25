import 'dart:convert';

class SharingFrictionInfo {
  bool? shouldHaveSharingFriction;
  dynamic bloksAppUrl;

  SharingFrictionInfo({this.shouldHaveSharingFriction, this.bloksAppUrl});

  factory SharingFrictionInfo.fromMap(Map<String, dynamic> data) {
    return SharingFrictionInfo(
      shouldHaveSharingFriction: data['should_have_sharing_friction'] as bool?,
      bloksAppUrl: data['bloks_app_url'] as dynamic,
    );
  }

  Map<String, dynamic> toMap() => {
        'should_have_sharing_friction': shouldHaveSharingFriction,
        'bloks_app_url': bloksAppUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SharingFrictionInfo].
  factory SharingFrictionInfo.fromJson(String data) {
    return SharingFrictionInfo.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SharingFrictionInfo] to a JSON string.
  String toJson() => json.encode(toMap());
}
