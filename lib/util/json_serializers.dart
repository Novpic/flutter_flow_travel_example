import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_flow_travel_example/models/place.dart';
import 'package:json_annotation/json_annotation.dart';

/// Timestamp serializer from [DateTime] to [Timestamp] and viceversa
class TimestampSerializer implements JsonConverter<DateTime, dynamic> {
  /// Default constructor
  const TimestampSerializer();

  @override
  DateTime fromJson(dynamic timestamp) => timestamp.toDate();

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

/// GeoPoint serializer from [GeoPoint] to [GeoLocation] and viceversa
class GeoPointSerializer implements JsonConverter<GeoLocation, GeoPoint> {
  /// Default constructor
  const GeoPointSerializer();

  @override
  GeoLocation fromJson(GeoPoint geoPoint) =>
      GeoLocation(geoPoint.latitude, geoPoint.longitude);

  @override
  GeoPoint toJson(GeoLocation geoLocation) =>
      GeoPoint(geoLocation.latitude, geoLocation.longitude);
}
