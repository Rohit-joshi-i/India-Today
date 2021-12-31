// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panchang_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AstrologerAgentDetailsResponse _$AstrologerAgentDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return AstrologerAgentDetailsResponse(
    json['httpStatus'] as String?,
    json['httpStatusCode'] as int?,
    json['success'] as bool?,
    json['message'] as String?,
    json['apiName'] as String?,
    (json['data'] as List<dynamic>)
        .map((e) => Data.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AstrologerAgentDetailsResponseToJson(
        AstrologerAgentDetailsResponse instance) =>
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
    json['id'] as int?,
    json['urlSlug'] as String?,
    json['firstName'] as String?,
    json['lastName'] as String?,
    json['aboutMe'] as String?,
    (json['experience'] as num?)?.toDouble(),
    (json['languages'] as List<dynamic>?)
        ?.map((e) => Languages.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['minimumCallDuration'] as int?,
    (json['minimumCallDurationCharges'] as num?)?.toDouble(),
    (json['additionalPerMinuteCharges'] as num?)?.toDouble(),
    json['isAvailable'] as bool?,
    (json['skills'] as List<dynamic>?)
        ?.map((e) => Skills.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['isOnCall'] as bool?,
    json['freeMinutes'] as int?,
    json['additionalMinute'] as int?,
    json['images'] == null
        ? null
        : Images.fromJson(json['images'] as Map<String, dynamic>),
    json['availability'] == null
        ? null
        : Availability.fromJson(json['availability'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'urlSlug': instance.urlSlug,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'aboutMe': instance.aboutMe,
      'experience': instance.experience,
      'languages': instance.languages,
      'minimumCallDuration': instance.minimumCallDuration,
      'minimumCallDurationCharges': instance.minimumCallDurationCharges,
      'additionalPerMinuteCharges': instance.additionalPerMinuteCharges,
      'isAvailable': instance.isAvailable,
      'skills': instance.skills,
      'isOnCall': instance.isOnCall,
      'freeMinutes': instance.freeMinutes,
      'additionalMinute': instance.additionalMinute,
      'images': instance.images,
      'availability': instance.availability,
    };

Languages _$LanguagesFromJson(Map<String, dynamic> json) {
  return Languages(
    json['id'] as int?,
    json['name'] as String?,
  );
}

Map<String, dynamic> _$LanguagesToJson(Languages instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Skills _$SkillsFromJson(Map<String, dynamic> json) {
  return Skills(
    json['id'] as int?,
    json['name'] as String?,
    json['description'] as String?,
  );
}

Map<String, dynamic> _$SkillsToJson(Skills instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return Images(
    json['large'] == null
        ? null
        : Large.fromJson(json['large'] as Map<String, dynamic>),
    json['medium'] == null
        ? null
        : Medium.fromJson(json['medium'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'large': instance.large,
      'medium': instance.medium,
    };

Large _$LargeFromJson(Map<String, dynamic> json) {
  return Large(
    json['imageUrl'] as String?,
    json['id'] as int?,
  );
}

Map<String, dynamic> _$LargeToJson(Large instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'id': instance.id,
    };

Medium _$MediumFromJson(Map<String, dynamic> json) {
  return Medium(
    json['imageUrl'] as String?,
    json['id'] as int?,
  );
}

Map<String, dynamic> _$MediumToJson(Medium instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'id': instance.id,
    };

Availability _$AvailabilityFromJson(Map<String, dynamic> json) {
  return Availability(
    (json['days'] as List<dynamic>?)?.map((e) => e as String).toList(),
    json['slot'] == null
        ? null
        : Slot.fromJson(json['slot'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AvailabilityToJson(Availability instance) =>
    <String, dynamic>{
      'days': instance.days,
      'slot': instance.slot,
    };

Slot _$SlotFromJson(Map<String, dynamic> json) {
  return Slot(
    json['toFormat'] as String?,
    json['fromFormat'] as String?,
    json['from'] as String?,
    json['to'] as String?,
  );
}

Map<String, dynamic> _$SlotToJson(Slot instance) => <String, dynamic>{
      'toFormat': instance.toFormat,
      'fromFormat': instance.fromFormat,
      'from': instance.from,
      'to': instance.to,
    };
