import 'package:json_annotation/json_annotation.dart';

part 'panchang_location_request_model.g.dart';


@JsonSerializable()
class PanchangLocationRequestModel extends Object {

  @JsonKey(name: 'day')
  int day;

  @JsonKey(name: 'month')
  int month;

  @JsonKey(name: 'year')
  int year;

  @JsonKey(name: 'placeId')
  String placeId;

  PanchangLocationRequestModel(this.day,this.month,this.year,this.placeId,);

  factory PanchangLocationRequestModel.fromJson(Map<String, dynamic> srcJson) => _$PanchangLocationRequestModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PanchangLocationRequestModelToJson(this);

}


