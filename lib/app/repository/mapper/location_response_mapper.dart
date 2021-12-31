import 'package:india/app/repository/model/panchang_location_model.dart';
import 'package:india/app/repository/response/panchang_location_response_model.dart';

PanchangLocationModel mapPanchangeLocation(PanchangLocationResponseModel response){
  var model = PanchangLocationModel()
  ..message = response.message
  ..list = _mapPanchangListLocation(response.data);
  return model;
}

List<LocationInformation> _mapPanchangListLocation(List<Data>? listData){
  var list = <LocationInformation>[];
  listData?.forEach((element) {
    var model = LocationInformation()
        ..placeId = element.placeId
        ..placeName = element.placeName;
    list.add(model);
  });
  return list;
}