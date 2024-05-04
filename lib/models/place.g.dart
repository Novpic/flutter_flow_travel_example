// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceImpl _$$PlaceImplFromJson(Map<String, dynamic> json) => _$PlaceImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      isFavorite: json['is_favorite'] as bool,
      imageUrl: json['image'] as String,
      lastUpdated: const TimestampSerializer().fromJson(json['last_updated']),
      location:
          const GeoPointSerializer().fromJson(json['location'] as GeoPoint),
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$$PlaceImplToJson(_$PlaceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_favorite': instance.isFavorite,
      'image': instance.imageUrl,
      'last_updated': const TimestampSerializer().toJson(instance.lastUpdated),
      'location': const GeoPointSerializer().toJson(instance.location),
      'rating': instance.rating,
    };
