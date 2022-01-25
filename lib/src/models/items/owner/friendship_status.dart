import 'dart:convert';

class FriendshipStatus {
	bool? following;
	bool? outgoingRequest;
	bool? isBestie;
	bool? isRestricted;
	bool? isFeedFavorite;

	FriendshipStatus({
		this.following, 
		this.outgoingRequest, 
		this.isBestie, 
		this.isRestricted, 
		this.isFeedFavorite, 
	});

	factory FriendshipStatus.fromMap(Map<String, dynamic> data) {
		return FriendshipStatus(
			following: data['following'] as bool?,
			outgoingRequest: data['outgoing_request'] as bool?,
			isBestie: data['is_bestie'] as bool?,
			isRestricted: data['is_restricted'] as bool?,
			isFeedFavorite: data['is_feed_favorite'] as bool?,
		);
	}



	Map<String, dynamic> toMap() => {
				'following': following,
				'outgoing_request': outgoingRequest,
				'is_bestie': isBestie,
				'is_restricted': isRestricted,
				'is_feed_favorite': isFeedFavorite,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FriendshipStatus].
	factory FriendshipStatus.fromJson(String data) {
		return FriendshipStatus.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [FriendshipStatus] to a JSON string.
	String toJson() => json.encode(toMap());
}
