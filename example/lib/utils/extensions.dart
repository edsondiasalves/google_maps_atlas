import 'package:atlas/atlas.dart';
import 'package:google_maps_atlas_example/utils/constants.dart';

extension CityToCameraPosition on City {
  CameraPosition toCameraPosition() {
    return CameraPosition(
      target: getCityCoordinates(this),
      zoom: 12,
    );
  }
}

extension MarkerPlaceToCameraPosition on MarkerPlace {
  CameraPosition toCameraPosition() {
    return CameraPosition(
      target: getMarkerPlaceCoordinates(this),
      zoom: 12,
    );
  }
}

LatLng getCityCoordinates(City city) {
  if (city == null) {
    return NewYorkCoordinates;
  }

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

LatLng getMarkerPlaceCoordinates(MarkerPlace markerPlace) {
  if (markerPlace == null) {
    return NewYorkCoordinates;
  }

  switch (markerPlace) {
    case MarkerPlace.NewYork:
      return NewYorkCoordinates;
      break;
    case MarkerPlace.London:
      return LondonCoordinates;
      break;
    case MarkerPlace.Beijing:
      return BeijingCoordinates;
      break;
    default:
      return NewYorkCoordinates;
      break;
  }
}
