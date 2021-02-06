import 'package:atlas/atlas.dart' as atlas;
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_atlas/src/google_atlas_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mockito/mockito.dart';

class MockGoogleMapsController extends Mock implements GoogleMapController {}

main() {
  group('GoogleAtlasController', () {
    GoogleMapController googleMapsController;
    GoogleAtlasController googleAtlasController;

    setUp(() {
      googleMapsController = MockGoogleMapsController();
      googleAtlasController = GoogleAtlasController(
        controller: googleMapsController,
      );
    });

    test('throws error when GoogleMapsController is null', () {
      try {
        GoogleAtlasController(controller: null);
      } catch (ex) {
        expect(ex, isAssertionError);
      }
    });

    test('calls GoogleMapsController moveCamera method', () async {
      final cameraPosition = atlas.CameraPosition(
        target: atlas.LatLng(latitude: 1.0, longitude: 2.0),
        zoom: 3.0,
      );

      await googleAtlasController.moveCamera(cameraPosition);
      verify(googleMapsController.moveCamera(any)).called(1);
    });
  });
}
