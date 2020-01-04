import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'campusfacility.g.dart';

@JsonSerializable()
class CampusFacility extends Equatable {
  final int campusFacilityId;
  final String name;

  @JsonKey(fromJson: _parseDouble)
  final double latitude;
  @JsonKey(fromJson: _parseDouble)
  final double longitude;

  final String content;

  CampusFacility({
    this.campusFacilityId,
    this.name,
    this.latitude,
    this.longitude,
    this.content,
  });

  @override
  List<Object> get props => [
        campusFacilityId,
        name,
        latitude,
        longitude,
        content,
      ];

  factory CampusFacility.fromJson(Map<String, dynamic> json) {
    return _$CampusFacilityFromJson(json);
  }
}

double _parseDouble(String num) => double.parse(num);
