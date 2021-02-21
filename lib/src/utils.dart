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

extension AtlasToGoogleMarker on Atlas.Marker {
  GoogleMaps.Marker toGoogleMapsMarkers() {
    return GoogleMaps.Marker(
      markerId: GoogleMaps.MarkerId(this.id),
      position: this.position.toGoogleMapsLatLng(),
    );
  }
}

extension AtlasToGoogleSetMarkers on Set<Atlas.Marker> {
  Set<GoogleMaps.Marker> toGoogleMapsSetMarkers() {
    List<GoogleMaps.Marker> googleMapsMarkers = [];

    this.forEach((Atlas.Marker atlasMarker) {
      final markers = atlasMarker.toGoogleMapsMarkers();
      googleMapsMarkers.add(markers);
    });

    return Set.from(googleMapsMarkers);
  }
}
