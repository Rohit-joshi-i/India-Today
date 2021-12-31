import 'package:india/app/repository/model/astrologer_agent_details_model.dart';
import 'package:india/app/repository/response/panchang_location_response.dart';

AstrologerAgentDetailsModel mapAstrologicalMapper(
    AstrologerAgentDetailsResponse response) {
  AstrologerAgentDetailsModel model = AstrologerAgentDetailsModel()
    ..message = response.message
    ..apiName = response.apiName
    ..httpStatus = response.httpStatus
    ..httpStatusCode = response.httpStatusCode
    ..success = response.success
    ..data = _mapAgentData(response.data);
  return model;
}

List<AgentData>? _mapAgentData(List<Data>? data) {
  var list = <AgentData>[];
  data?.forEach((element) {
    var model = AgentData()
      ..id = element.id
      ..firstName = element.firstName
      ..lastName = element.lastName
      ..aboutMe = element.aboutMe
      ..additionalMinute = element.additionalMinute
      ..additionalPerMinuteCharges = element.additionalPerMinuteCharges
      ..experience = element.experience
      ..isAvailable = element.isAvailable
      ..freeMinutes = element.freeMinutes
      ..isOnCall = element.isOnCall
      ..urlSlug = element.urlSlug
      ..availability = _mapAvailabilityInDays(element.availability)
      ..images = _mapImageModel(element.images)
      ..minimumCallDurationCharges = element.minimumCallDurationCharges
      ..languages = _mapLanguage(element.languages)
      ..skills = _mapSkills(element.skills);
    list.add(model);
  });
  return list;
}

AvailabilityInDays _mapAvailabilityInDays(Availability? availability) {
  var model = AvailabilityInDays()
    ..days = availability?.days
    ..slot = _mapSlot(availability?.slot);
  return model;
}

Slots _mapSlot(Slot? slot) {
  var model = Slots()
    ..from = slot?.from
    ..fromFormat = slot?.fromFormat
    ..to = slot?.to
    ..toFormat = slot?.toFormat;
  return model;
}

Image _mapImageModel(Images?images) {
  var model = Image()
    ..large = Big(imageUrl: images?.large?.imageUrl, id: images?.large?.id)
    ..medium = Mid(id: images?.medium?.id, imageUrl: images?.medium?.imageUrl);
  return model;
}

List<Language> _mapLanguage(List<Languages>? languages) {
  var list = <Language>[];
  languages?.forEach((element) {
    var model = Language()
      ..id = element.id
      ..name = element.name;
    list.add(model);
  });
  return list;
}

List<Skill> _mapSkills(List<Skills>? skills) {
  var list = <Skill>[];
  skills?.forEach((element) {
    var model = Skill()
      ..name = element.name
      ..description = element.description
      ..id = element.id;
    list.add(model);
  });
  return list;
}
