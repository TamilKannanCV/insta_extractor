import 'dart:convert';

import 'package:insta_extractor/src/models/items/image_versions/image_versions2.dart';

import 'comment_inform_treatment.dart';
import 'sharing_friction_info.dart';
import 'video_version.dart';

class CarouselMedia {
	String? id;
	int? mediaType;
	ImageVersions2? imageVersions2;
	int? originalWidth;
	int? originalHeight;
	List<VideoVersion>? videoVersions;
	int? videoDuration;
	int? isDashEligible;
	String? videoDashManifest;
	String? videoCodec;
	int? numberOfQualities;
	int? pk;
	String? carouselParentId;
	bool? canSeeInsightsAsBrand;
	String? commercialityStatus;
	SharingFrictionInfo? sharingFrictionInfo;
	CommentInformTreatment? commentInformTreatment;

	CarouselMedia({
		this.id, 
		this.mediaType, 
		this.imageVersions2, 
		this.originalWidth, 
		this.originalHeight, 
		this.videoVersions, 
		this.videoDuration, 
		this.isDashEligible, 
		this.videoDashManifest, 
		this.videoCodec, 
		this.numberOfQualities, 
		this.pk, 
		this.carouselParentId, 
		this.canSeeInsightsAsBrand, 
		this.commercialityStatus, 
		this.sharingFrictionInfo, 
		this.commentInformTreatment, 
	});

	factory CarouselMedia.fromMap(Map<String, dynamic> data) => CarouselMedia(
				id: data['id'] as String?,
				mediaType: data['media_type'] as int?,
				imageVersions2: data['image_versions2'] == null
						? null
						: ImageVersions2.fromMap(data['image_versions2'] as Map<String, dynamic>),
				originalWidth: data['original_width'] as int?,
				originalHeight: data['original_height'] as int?,
				videoVersions: (data['video_versions'] as List<dynamic>?)
						?.map((e) => VideoVersion.fromMap(e as Map<String, dynamic>))
						.toList(),
				videoDuration: data['video_duration'] as int?,
				isDashEligible: data['is_dash_eligible'] as int?,
				videoDashManifest: data['video_dash_manifest'] as String?,
				videoCodec: data['video_codec'] as String?,
				numberOfQualities: data['number_of_qualities'] as int?,
				pk: data['pk'] as int?,
				carouselParentId: data['carousel_parent_id'] as String?,
				canSeeInsightsAsBrand: data['can_see_insights_as_brand'] as bool?,
				commercialityStatus: data['commerciality_status'] as String?,
				sharingFrictionInfo: data['sharing_friction_info'] == null
						? null
						: SharingFrictionInfo.fromMap(data['sharing_friction_info'] as Map<String, dynamic>),
				commentInformTreatment: data['comment_inform_treatment'] == null
						? null
						: CommentInformTreatment.fromMap(data['comment_inform_treatment'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'media_type': mediaType,
				'image_versions2': imageVersions2?.toMap(),
				'original_width': originalWidth,
				'original_height': originalHeight,
				'video_versions': videoVersions?.map((e) => e.toMap()).toList(),
				'video_duration': videoDuration,
				'is_dash_eligible': isDashEligible,
				'video_dash_manifest': videoDashManifest,
				'video_codec': videoCodec,
				'number_of_qualities': numberOfQualities,
				'pk': pk,
				'carousel_parent_id': carouselParentId,
				'can_see_insights_as_brand': canSeeInsightsAsBrand,
				'commerciality_status': commercialityStatus,
				'sharing_friction_info': sharingFrictionInfo?.toMap(),
				'comment_inform_treatment': commentInformTreatment?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CarouselMedia].
	factory CarouselMedia.fromJson(String data) {
		return CarouselMedia.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [CarouselMedia] to a JSON string.
	String toJson() => json.encode(toMap());
}
