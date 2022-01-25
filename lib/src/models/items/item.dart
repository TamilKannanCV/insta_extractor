import 'dart:convert';

import 'carousel_media/carousel_media.dart';
import 'image_versions/image_versions2.dart';
import 'owner/owner.dart';
import 'video_version.dart';

class Item {
  int? pk;
  String? id;
  int? deviceTimestamp;
  int? mediaType;
  String? code;
  String? clientCacheKey;
  int? filterType;
  int? carouselMediaCount;
  List<CarouselMedia>? carouselMedia;
  Owner? owner;
  List<VideoVersion>? videoVersions;
  ImageVersions2? imageVersions2;

  Item({
    this.pk,
    this.id,
    this.deviceTimestamp,
    this.mediaType,
    this.code,
    this.clientCacheKey,
    this.filterType,
    this.carouselMediaCount,
    this.carouselMedia,
    this.owner,
    this.videoVersions,
    this.imageVersions2,
  });

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        pk: data['pk'] as int?,
        id: data['id'] as String?,
        deviceTimestamp: data['device_timestamp'] as int?,
        mediaType: data['media_type'] as int?,
        code: data['code'] as String?,
        clientCacheKey: data['client_cache_key'] as String?,
        filterType: data['filter_type'] as int?,
        carouselMediaCount: data['carousel_media_count'] as int?,
        imageVersions2: data['image_versions2'] == null
            ? null
            : ImageVersions2.fromMap(
                data['image_versions2'] as Map<String, dynamic>),
        videoVersions: data['video_versions'] == null
            ? null
            : (data['video_versions'] as List<dynamic>?)
                ?.map((e) => VideoVersion.fromMap(e as Map<String, dynamic>))
                .toList(),
        carouselMedia: (data['carousel_media'] as List<dynamic>?)
            ?.map((e) => CarouselMedia.fromMap(e as Map<String, dynamic>))
            .toList(),
        owner: data['user'] == null
            ? null
            : Owner.fromMap(data['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'pk': pk,
        'id': id,
        'device_timestamp': deviceTimestamp,
        'media_type': mediaType,
        'code': code,
        'client_cache_key': clientCacheKey,
        'filter_type': filterType,
        'carousel_media_count': carouselMediaCount,
        'carousel_media': carouselMedia?.map((e) => e.toMap()).toList(),
        'user': owner?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory Item.fromJson(String data) {
    final _data = json.decode(data) as Map<String, dynamic>;
    return Item.fromMap(_data['items'][0]);
  }

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());
}
