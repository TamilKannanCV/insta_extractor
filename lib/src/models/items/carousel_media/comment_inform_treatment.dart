import 'dart:convert';

class CommentInformTreatment {
  bool? shouldHaveInformTreatment;
  String? text;

  CommentInformTreatment({this.shouldHaveInformTreatment, this.text});

  factory CommentInformTreatment.fromMap(Map<String, dynamic> data) {
    return CommentInformTreatment(
      shouldHaveInformTreatment: data['should_have_inform_treatment'] as bool?,
      text: data['text'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'should_have_inform_treatment': shouldHaveInformTreatment,
        'text': text,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CommentInformTreatment].
  factory CommentInformTreatment.fromJson(String data) {
    return CommentInformTreatment.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CommentInformTreatment] to a JSON string.
  String toJson() => json.encode(toMap());
}
