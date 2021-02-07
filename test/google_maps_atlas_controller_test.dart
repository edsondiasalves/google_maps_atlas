import 'package:atlas/atlas.dart' as atlas;
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_atlas/src/google_maps_atlas_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mockito/mockito.dart';

class MockGoogleMapsController extends Mock implements GoogleMapController {}

main() {
  group('GoogleMapsAtlasController', () {
    GoogleMapController googleMapsController;
    GoogleMapsAtlasController googleAtlasController;

    setUp(() {
      googleMapsController = MockGoogleMapsController();
      googleAtlasController = GoogleMapsAtlasController(
        controller: googleMapsController,
      );
    });

    test('throws error when GoogleMapController is null', () {
      try {
        GoogleMapsAtlasController(controller: null);
      } catch (ex) {
        expect(ex, isAssertionError);
      }
    });

    test('calls GoogleMapController moveCamera method', () async {
      final cameraPosition = atlas.CameraPosition(
        target: atlas.LatLng(latitude: 1.0, longitude: 2.0),
        zoom: 3.0,
      );

      await googleAtlasController.moveCamera(cameraPosition);
      verify(googleMapsController.moveCamera(any)).called(1);
    });
  });
}
