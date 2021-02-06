import 'package:atlas/atlas.dart' as Atlas;
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;

extension AtlasToGoogleLatLng on Atlas.LatLng {
  GoogleMaps.LatLng toGoogleMapsLatLng() {
    return GoogleMaps.LatLng(this.latitude, this.longitude);
  }
}

extension AtlasToGoogleCameraPosition on Atlas.CameraPosition {
  GoogleMaps.CameraPosition toGoogleMapsCameraPosition() {
    return GoogleMaps.CameraPosition(
      target: this.target.toGoogleMapsLatLng(),
      zoom: this.zoom,
    );
  }
}
