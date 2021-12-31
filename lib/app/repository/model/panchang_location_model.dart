class PanchangLocationModel {
  String? message;
  List<LocationInformation>? list;

  PanchangLocationModel({
    this.list,
  });
}

class LocationInformation {
  String? placeName;

  String? placeId;

  LocationInformation({
    this.placeName,
    this.placeId,
  });
}
