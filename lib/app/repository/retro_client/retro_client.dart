import 'package:dio/dio.dart';
import 'package:india/app/repository/response/panchang_location_response.dart';
import 'package:india/app/repository/response/panchang_location_response_model.dart';
import 'package:india/resources/api_endpoints.dart';
import 'package:retrofit/http.dart';

part 'retro_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(
    Dio dio,
  ) {
    return _ApiClient(dio);
  }

  @GET(kLocation)
  Future<PanchangLocationResponseModel> getPanchangLocation(
      @Path('inputPlace') String inputPlace);

  @GET(kGetAllAgent)
  Future<AstrologerAgentDetailsResponse> getAllAgentsModel();
}
