import 'dart:convert';

class User {
	int? pk;
	String? username;
	String? fullName;
	String? profilePicUrl;

	User({this.pk, this.username, this.fullName, this.profilePicUrl});

	@override
	String toString() {
		return 'User(pk: $pk, username: $username, fullName: $fullName, profilePicUrl: $profilePicUrl)';
	}

	factory User.fromMap(Map<String, dynamic> data) => User(
				pk: data['pk'] as int?,
				username: data['username'] as String?,
				fullName: data['full_name'] as String?,
				profilePicUrl: data['profile_pic_url'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'pk': pk,
				'username': username,
				'full_name': fullName,
				'profile_pic_url': profilePicUrl,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
	factory User.fromJson(String data) {
		return User.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
	String toJson() => json.encode(toMap());
}
