import 'package:json_annotation/json_annotation.dart';

part 'panchang_location_response.g.dart';


@JsonSerializable()
class AstrologerAgentDetailsResponse extends Object {

  @JsonKey(name: 'httpStatus')
  String? httpStatus;

  @JsonKey(name: 'httpStatusCode')
  int? httpStatusCode;

  @JsonKey(name: 'success')
  bool? success;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'apiName')
  String? apiName;

  @JsonKey(name: 'data')
  List<Data> data;

  AstrologerAgentDetailsResponse(this.httpStatus,this.httpStatusCode,this.success,this.message,this.apiName,this.data,);

  factory AstrologerAgentDetailsResponse.fromJson(Map<String, dynamic> srcJson) => _$AstrologerAgentDetailsResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AstrologerAgentDetailsResponseToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'urlSlug')
  String? urlSlug;

  @JsonKey(name: 'firstName')
  String? firstName;

  @JsonKey(name: 'lastName')
  String? lastName;

  @JsonKey(name: 'aboutMe')
  String? aboutMe;

  @JsonKey(name: 'experience')
  double? experience;

  @JsonKey(name: 'languages')
  List<Languages>? languages;

  @JsonKey(name: 'minimumCallDuration')
  int? minimumCallDuration;

  @JsonKey(name: 'minimumCallDurationCharges')
  double? minimumCallDurationCharges;

  @JsonKey(name: 'additionalPerMinuteCharges')
  double? additionalPerMinuteCharges;

  @JsonKey(name: 'isAvailable')
  bool?isAvailable;

  @JsonKey(name: 'skills')
  List<Skills>? skills;

  @JsonKey(name: 'isOnCall')
  bool? isOnCall;

  @JsonKey(name: 'freeMinutes')
  int? freeMinutes;

  @JsonKey(name: 'additionalMinute')
  int? additionalMinute;

  @JsonKey(name: 'images')
  Images? images;

  @JsonKey(name: 'availability')
  Availability? availability;

  Data(this.id,this.urlSlug,this.firstName,this.lastName,this.aboutMe,this.experience,this.languages,this.minimumCallDuration,this.minimumCallDurationCharges,this.additionalPerMinuteCharges,this.isAvailable,this.skills,this.isOnCall,this.freeMinutes,this.additionalMinute,this.images,this.availability,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Languages extends Object {

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;

  Languages(this.id,this.name,);

  factory Languages.fromJson(Map<String, dynamic> srcJson) => _$LanguagesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LanguagesToJson(this);

}


@JsonSerializable()
class Skills extends Object {

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'description')
  String? description;

  Skills(this.id,this.name,this.description,);

  factory Skills.fromJson(Map<String, dynamic> srcJson) => _$SkillsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SkillsToJson(this);

}


@JsonSerializable()
class Images extends Object {


  @JsonKey(name: 'large')
  Large? large;

  @JsonKey(name: 'medium')
  Medium?medium;

  Images(this.large,this.medium,);

  factory Images.fromJson(Map<String, dynamic> srcJson) => _$ImagesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);

}




@JsonSerializable()
class Large extends Object {

  @JsonKey(name: 'imageUrl')
  String? imageUrl;

  @JsonKey(name: 'id')
  int? id;

  Large(this.imageUrl,this.id,);

  factory Large.fromJson(Map<String, dynamic> srcJson) => _$LargeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LargeToJson(this);

}


@JsonSerializable()
class Medium extends Object {

  @JsonKey(name: 'imageUrl')
  String? imageUrl;

  @JsonKey(name: 'id')
  int? id;

  Medium(this.imageUrl,this.id,);

  factory Medium.fromJson(Map<String, dynamic> srcJson) => _$MediumFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MediumToJson(this);

}


@JsonSerializable()
class Availability extends Object {

  @JsonKey(name: 'days')
  List<String>? days;

  @JsonKey(name: 'slot')
  Slot? slot;

  Availability(this.days,this.slot,);

  factory Availability.fromJson(Map<String, dynamic> srcJson) => _$AvailabilityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AvailabilityToJson(this);

}


@JsonSerializable()
class Slot extends Object {

  @JsonKey(name: 'toFormat')
  String? toFormat;

  @JsonKey(name: 'fromFormat')
  String? fromFormat;

  @JsonKey(name: 'from')
  String? from;

  @JsonKey(name: 'to')
  String? to;

  Slot(this.toFormat,this.fromFormat,this.from,this.to,);

  factory Slot.fromJson(Map<String, dynamic> srcJson) => _$SlotFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SlotToJson(this);

}


