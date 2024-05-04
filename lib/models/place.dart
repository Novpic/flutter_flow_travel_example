import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_flow_travel_example/util/json_serializers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';
part 'place.g.dart';

@freezed
class Place with _$Place {
  @JsonSerializable(explicitToJson: true)
  factory Place({
    required String id,
    required String name,
    @JsonKey(name: 'is_favorite') required bool isFavorite,
    @JsonKey(name: 'image') required String imageUrl,
    @JsonKey(name: 'last_updated')
    @TimestampSerializer()
    required DateTime lastUpdated,
    @GeoPointSerializer() required GeoLocation location,
    required double rating,
  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}

class GeoLocation {
  final double latitude;
  final double longitude;

  GeoLocation(this.latitude, this.longitude);
}
