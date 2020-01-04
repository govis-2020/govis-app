// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campusfacility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampusFacility _$CampusFacilityFromJson(Map<String, dynamic> json) {
  return CampusFacility(
    campusFacilityId: json['campusFacilityId'] as int,
    name: json['name'] as String,
    latitude: _parseDouble(json['latitude'] as String),
    longitude: _parseDouble(json['longitude'] as String),
    content: json['content'] as String,
  );
}

Map<String, dynamic> _$CampusFacilityToJson(CampusFacility instance) =>
    <String, dynamic>{
      'campusFacilityId': instance.campusFacilityId,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'content': instance.content,
    };
