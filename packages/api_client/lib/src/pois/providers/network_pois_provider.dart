import '../../api_client.dart';
import '../../dto/pois_dto.dart';
import '../mappers/pois_mapper.dart';
import '../models/pois_model.dart';
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
