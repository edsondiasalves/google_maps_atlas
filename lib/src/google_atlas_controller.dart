import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;

import 'utils.dart';

class GoogleAtlasController implements AtlasController {
  final GoogleMaps.GoogleMapController _controller;

  GoogleAtlasController({@required GoogleMaps.GoogleMapController controller})
      : assert(controller != null),
        _controller = controller;

  @override
  void changeUserLocationIcon(String asset) {}

  @override
  Future<CameraPosition> getCameraPosition() {
    throw UnimplementedError();
  }

  @override
  Future<LatLng> getLatLng(ScreenCoordinates screenCoordinates) {
    throw UnimplementedError();
  }

  @override
  Future<ScreenCoordinates> getScreenCoordinate(LatLng latLng) {
    throw UnimplementedError();
  }

  @override
  Future<LatLngBounds> getVisibleArea() {
    throw UnimplementedError();
  }

  @override
  Future<void> moveCamera(CameraPosition cameraPosition) {
    return _controller.moveCamera(
      GoogleMaps.CameraUpdate.newCameraPosition(
        cameraPosition.toGoogleMapsCameraPosition(),
      ),
    );
  }

  @override
  Future<void> updateBounds(LatLngBounds bounds, double padding) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateBoundsWithPaddingToAllSides(
    LatLngBounds bounds,
    double north,
    double east,
    double south,
    double west,
  ) {
    throw UnimplementedError();
  }
}
