// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panchang_location_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PanchangLocationResponseModel _$PanchangLocationResponseModelFromJson(
    Map<String, dynamic> json) {
  return PanchangLocationResponseModel(
    json['httpStatus'] as String,
    json['httpStatusCode'] as int,
    json['success'] as bool,
    json['message'] as String,
    json['apiName'] as String,
    (json['data'] as List<dynamic>?)
        ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PanchangLocationResponseModelToJson(
        PanchangLocationResponseModel instance) =>
    <String, dynamic>{
      'httpStatus': instance.httpStatus,
      'httpStatusCode': instance.httpStatusCode,
      'success': instance.success,
      'message': instance.message,
      'apiName': instance.apiName,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['placeName'] as String?,
    json['placeId'] as String?,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'placeName': instance.placeName,
      'placeId': instance.placeId,
    };
