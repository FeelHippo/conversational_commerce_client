import 'package:apiClient/src/api_client.dart';
import 'package:apiClient/src/dto/pois_dto.dart';
import 'package:apiClient/src/pois/mappers/pois_mapper.dart';
import 'package:apiClient/src/pois/models/pois_model.dart';

import 'pois_provider.dart';

class NetworkPOIsProvider extends POIsProvider {
  NetworkPOIsProvider(this._apiClient, this._mapper);
  final ApiClient _apiClient;
  final POIMapper _mapper;

  @override
  Future<List<POIModel>> getPOIs() async {
    final List<POIDto> response = await _apiClient.getPOIs();
    return response.map(_mapper.map).toList();
  }
}
