import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'dto/pois_dto.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;
  // Fetches POIs for an unauthenticated user
  @GET('/view-zuerivelo-publibike')
  Future<List<POIDto>> getPOIs();
}
