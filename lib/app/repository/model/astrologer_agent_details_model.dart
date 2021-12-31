class AstrologerAgentDetailsModel {
  String? httpStatus;

  int? httpStatusCode;

  bool? success;

  String? message;

  String? apiName;

  List<AgentData>? data;

  AstrologerAgentDetailsModel({
    this.httpStatus,
    this.httpStatusCode,
    this.success,
    this.message,
    this.apiName,
    this.data,
  });
}

class AgentData {
  int? id;

  String? urlSlug;

  String? firstName;

  String? lastName;

  String? aboutMe;

  double? experience;

  List<Language>? languages;

  int? minimumCallDuration;

  double? minimumCallDurationCharges;

  double? additionalPerMinuteCharges;

  bool? isAvailable;

  List<Skill>? skills;

  bool? isOnCall;

  int? freeMinutes;

  int? additionalMinute;

  Image? images;

  AvailabilityInDays? availability;

  AgentData({
    this.id,
    this.urlSlug,
    this.firstName,
    this.lastName,
    this.aboutMe,
    this.experience,
    this.languages,
    this.minimumCallDuration,
    this.minimumCallDurationCharges,
    this.additionalPerMinuteCharges,
    this.isAvailable,
    this.skills,
    this.isOnCall,
    this.freeMinutes,
    this.additionalMinute,
    this.images,
    this.availability,
  });
}

class Language {
  int? id;

  String? name;

  Language({
    this.id,
    this.name,
  });
}

class Skill {
  int? id;

  String? name;

  String? description;

  Skill({
    this.id,
    this.name,
    this.description,
  });
}

class Image {
  Big? large;

  Mid? medium;

  Image({
    this.large,
    this.medium,
  });
}

class Big {
  String? imageUrl;

  int? id;

  Big({
    this.imageUrl,
    this.id,
  });
}

class Mid {
  String? imageUrl;

  int? id;

  Mid({
    this.imageUrl,
    this.id,
  });
}

class AvailabilityInDays {
  List<String?>? days;

  Slots? slot;

  AvailabilityInDays({
    this.days,
    this.slot,
  });
}

class Slots {
  String? toFormat;

  String? fromFormat;

  String? from;

  String? to;

  Slots({
    this.toFormat,
    this.fromFormat,
    this.from,
    this.to,
  });
}
