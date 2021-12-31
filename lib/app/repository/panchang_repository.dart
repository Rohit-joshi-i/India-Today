import 'package:india/app/repository/model/astrologer_agent_details_model.dart';
import 'package:india/app/repository/retro_client/retro_client.dart';
import 'package:india/services/api/api_response_wrapper.dart';
import 'package:india/services/api/app_exception.dart';
import 'package:india/services/api/service_manager.dart';
import 'package:india/services/config/flavor_config.dart';

import 'mapper/astrological_agent_mapper.dart';
import 'mapper/location_response_mapper.dart';
import 'model/panchang_location_model.dart';

class Repository {
  ApiClient? _apiClient;

  Repository() {
    var dioClient = ServiceManager.get().getDioClient(
      baseUrl: FlavorConfig.instance.flavorValues.baseUrl,
    );
    _apiClient = ApiClient(dioClient);
  }

  Future<ApiResponseWrapper<PanchangLocationModel>> getAllAvailableLocation(
      String inputLocation) async {
    try {
      var response = await _apiClient!.getPanchangLocation(inputLocation);
      return ApiResponseWrapper()..setData(mapPanchangeLocation(response));
    } on Exception catch (exception) {
      return ApiResponseWrapper()..setException(ExceptionHandler(exception));
    }
  }

  Future<ApiResponseWrapper<AstrologerAgentDetailsModel>> getAllAgentInformation() async {
    try {
      var response = await _apiClient!.getAllAgentsModel();
      return ApiResponseWrapper()..setData(mapAstrologicalMapper(response));
    } on Exception catch (exception) {
      return ApiResponseWrapper()..setException(ExceptionHandler(exception));
    }
  }
}
