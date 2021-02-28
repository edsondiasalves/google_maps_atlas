import 'dart:ui' as ui;

import 'package:atlas/atlas.dart' as Atlas;
import 'package:flutter/services.dart';
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
  Future<GoogleMaps.Marker> toGoogleMapsMarker() async {
    return GoogleMaps.Marker(
      markerId: GoogleMaps.MarkerId(this.id),
      position: this.position.toGoogleMapsLatLng(),
      icon: await _markerToBitmapDescriptor(this.icon),
    );
  }
}

extension AtlasToGoogleSetMarkers on Set<Atlas.Marker> {
  Future<Set<GoogleMaps.Marker>> toGoogleMapsSetMarkers() async {
    List<GoogleMaps.Marker> googleMapsMarkers = [];

    for (Atlas.Marker marker in this) {
      final markers = await marker.toGoogleMapsMarker();
      googleMapsMarkers.add(markers);
    }

    return Set.from(googleMapsMarkers);
  }
}

Future<GoogleMaps.BitmapDescriptor> _markerToBitmapDescriptor(
  Atlas.MarkerIcon markerIcon,
) async {
  final resizedImage = await _loadAsset(markerIcon);
  final imageBytes = resizedImage.buffer.asUint8List();
  final bitmapDescriptor = GoogleMaps.BitmapDescriptor.fromBytes(imageBytes);
  return bitmapDescriptor;
}

Future<ByteData> _loadAsset(Atlas.MarkerIcon markerIcon) async {
  final assetPixelData = await rootBundle.load(markerIcon.assetName);

  final codec = await ui.instantiateImageCodec(
    assetPixelData.buffer.asUint8List(),
    targetWidth: markerIcon.width,
  );

  final image = (await codec.getNextFrame()).image;

  final imageBytes = await image.toByteData(
    format: ui.ImageByteFormat.png,
  );
  return imageBytes;
}
