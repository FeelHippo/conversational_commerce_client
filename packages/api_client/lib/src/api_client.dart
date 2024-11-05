import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'dto/pois_dto.dart';
import 'requests/dynamic_service_request.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;
  // Fetches POIs for an unauthenticated user
  @POST('/zueriplan3/ServiceContracts/DataService.svc/GetWFSFeatures')
  Future<List<POIDto>> getPOIs({
    @Body() required DynamicServiceRequest dynamicServiceRequest,
    @Header(':authority') required String authority,
    @Header(':method') required String method,
    @Header(':path') required String path,
    @Header(':scheme') required String scheme,
  });
}
