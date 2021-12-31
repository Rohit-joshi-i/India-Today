import 'package:json_annotation/json_annotation.dart';

part 'panchang_location_response_model.g.dart';


@JsonSerializable()
class PanchangLocationResponseModel extends Object {

  @JsonKey(name: 'httpStatus')
  String httpStatus;

  @JsonKey(name: 'httpStatusCode')
  int httpStatusCode;

  @JsonKey(name: 'success')
  bool success;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'apiName')
  String apiName;

  @JsonKey(name: 'data')
  List<Data>? data;

  PanchangLocationResponseModel(this.httpStatus,this.httpStatusCode,this.success,this.message,this.apiName,this.data,);

  factory PanchangLocationResponseModel.fromJson(Map<String, dynamic> srcJson) => _$PanchangLocationResponseModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PanchangLocationResponseModelToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'placeName')
  String? placeName;

  @JsonKey(name: 'placeId')
  String? placeId;

  Data(this.placeName,this.placeId,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


