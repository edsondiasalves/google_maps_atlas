import 'package:atlas/atlas.dart';
import 'package:google_maps_atlas_example/utils/constants.dart';

extension CityToCameraPosition on City {
  CameraPosition toCameraPosition() {
    return CameraPosition(
      target: getCityCoordinates(this),
      zoom: 13,
    );
  }
}

LatLng getCityCoordinates(City city) {
  switch (city) {
    case City.Lisbon:
      return LisbonCoordinates;
      break;
    case City.SaoPaulo:
      return SaoPauloCoordinates;
      break;
    case City.Tokyo:
      return TokyoCoordinates;
      break;
    default:
      return LisbonCoordinates;
      break;
  }
}
