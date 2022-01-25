import 'dart:convert';

import 'friendship_status.dart';

class Owner {
	int? pk;
	String? username;
	String? fullName;
	bool? isPrivate;
	String? profilePicUrl;
	String? profilePicId;
	FriendshipStatus? friendshipStatus;
	bool? isVerified;
	int? followFrictionType;
	bool? hasAnonymousProfilePicture;
	bool? isUnpublished;
	bool? isFavorite;
	int? latestReelMedia;
	bool? hasHighlightReels;
	dynamic liveBroadcastId;
	dynamic liveBroadcastVisibility;

	Owner({
		this.pk, 
		this.username, 
		this.fullName, 
		this.isPrivate, 
		this.profilePicUrl, 
		this.profilePicId, 
		this.friendshipStatus, 
		this.isVerified, 
		this.followFrictionType, 
		this.hasAnonymousProfilePicture, 
		this.isUnpublished, 
		this.isFavorite, 
		this.latestReelMedia, 
		this.hasHighlightReels, 
		this.liveBroadcastId, 
		this.liveBroadcastVisibility, 
	});

	factory Owner.fromMap(Map<String, dynamic> data) => Owner(
				pk: data['pk'] as int?,
				username: data['username'] as String?,
				fullName: data['full_name'] as String?,
				isPrivate: data['is_private'] as bool?,
				profilePicUrl: data['profile_pic_url'] as String?,
				profilePicId: data['profile_pic_id'] as String?,
				friendshipStatus: data['friendship_status'] == null
						? null
						: FriendshipStatus.fromMap(data['friendship_status'] as Map<String, dynamic>),
				isVerified: data['is_verified'] as bool?,
				followFrictionType: data['follow_friction_type'] as int?,
				hasAnonymousProfilePicture: data['has_anonymous_profile_picture'] as bool?,
				isUnpublished: data['is_unpublished'] as bool?,
				isFavorite: data['is_favorite'] as bool?,
				latestReelMedia: data['latest_reel_media'] as int?,
				hasHighlightReels: data['has_highlight_reels'] as bool?,
				liveBroadcastId: data['live_broadcast_id'] as dynamic,
				liveBroadcastVisibility: data['live_broadcast_visibility'] as dynamic,
			);

	Map<String, dynamic> toMap() => {
				'pk': pk,
				'username': username,
				'full_name': fullName,
				'is_private': isPrivate,
				'profile_pic_url': profilePicUrl,
				'profile_pic_id': profilePicId,
				'friendship_status': friendshipStatus?.toMap(),
				'is_verified': isVerified,
				'follow_friction_type': followFrictionType,
				'has_anonymous_profile_picture': hasAnonymousProfilePicture,
				'is_unpublished': isUnpublished,
				'is_favorite': isFavorite,
				'latest_reel_media': latestReelMedia,
				'has_highlight_reels': hasHighlightReels,
				'live_broadcast_id': liveBroadcastId,
				'live_broadcast_visibility': liveBroadcastVisibility,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Owner].
	factory Owner.fromJson(String data) {
		return Owner.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Owner] to a JSON string.
	String toJson() => json.encode(toMap());
}
