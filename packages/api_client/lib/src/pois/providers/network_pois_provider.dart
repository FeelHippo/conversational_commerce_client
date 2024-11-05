import 'package:collection/collection.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../api_client.dart';
import '../../dto/pois_dto.dart';
import '../../requests/dynamic_service_request.dart';
import '../mappers/pois_mapper.dart';
import '../models/pois_model.dart';
import 'pois_provider.dart';

class NetworkPOIsProvider extends POIsProvider {
  NetworkPOIsProvider(this._apiClient, this._mapper);
  final ApiClient _apiClient;
  final POIMapper _mapper;

  @override
  Future<List<POIModel>> getPOIs({
    required LatLngBounds bounds,
    required String type, // i.e. 'ZplExtent:#ZueriPlan.ServiceModel'
  }) async {
    final List<POIDto> response = await _apiClient.getPOIs(
      dynamicServiceRequest: DynamicServiceRequest(
        appId: 0,
        bbox: BboxRequest(
          // longitude
          XMax: bounds.northeast.longitude,
          XMin: bounds.southwest.longitude,
          // latitude
          YMax: bounds.southwest.latitude,
          YMin: bounds.northeast.latitude,
          type: type,
        ),
        dynamicServiceId: 1,
        layernames: ["Baeder", "Biken", "Laufen", "Schlitteln", "Sportanlagen", "Tennisplaetze", "Velopumpstationen", "Veloverleihe"],
        wkid: 2056,
      ),
      authority: 'www.maps.stadt-zuerich.ch',
      method: 'POST',
      path: '/zueriplan3/ServiceContracts/DataService.svc/GetWFSFeatures',
      scheme: 'https',
    );
    return (
        response
        .map(_mapper.map)
        .whereNotNull()
        .toList()
    ).flattened.toList();
  }
}
