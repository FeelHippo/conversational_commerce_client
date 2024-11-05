import 'package:collection/collection.dart';
import '../../dto/pois_dto.dart';
import '../../location/location_mapper.dart';
import '../models/pois_model.dart';

class POIMapper {
  POIMapper(this.locationMapper);
  final LocationMapper locationMapper;

  List<POIModel>? map(POIDto dto) {
    return dto
        .geometry
        .points
        ?.map(
            (Point points) =>
                points.pointsList.map(
                    (Coordinates point) => POIModel(
                        locationMapper.map(point),
                        '',
                    )
                ).toList(),
    ).flattened.toList();
  }
}
