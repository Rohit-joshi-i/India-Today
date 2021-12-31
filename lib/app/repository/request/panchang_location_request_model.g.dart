// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panchang_location_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PanchangLocationRequestModel _$PanchangLocationRequestModelFromJson(
    Map<String, dynamic> json) {
  return PanchangLocationRequestModel(
    json['day'] as int,
    json['month'] as int,
    json['year'] as int,
    json['placeId'] as String,
  );
}

Map<String, dynamic> _$PanchangLocationRequestModelToJson(
        PanchangLocationRequestModel instance) =>
    <String, dynamic>{
      'day': instance.day,
      'month': instance.month,
      'year': instance.year,
      'placeId': instance.placeId,
    };
