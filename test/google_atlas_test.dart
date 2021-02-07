import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_atlas/google_atlas.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;

import 'fake_maps_controller.dart';

main() {
  final FakePlatformViewsController fakePlatformViewsController =
      FakePlatformViewsController();

  setUpAll(() {
    SystemChannels.platform_views.setMockMethodCallHandler(
      fakePlatformViewsController.fakePlatformViewsMethodHandler,
    );
  });

  group('Google Atlas', () {
    GoogleAtlas googleAtlas;
    CameraPosition initialCameraPosition;

    setUp(() {
      googleAtlas = GoogleAtlas();
      AtlasProvider.instance = googleAtlas;
      initialCameraPosition = CameraPosition(
        target: LatLng(
          latitude: 41.8781,
          longitude: -87.6298,
        ),
        zoom: 12,
      );
      fakePlatformViewsController.reset();
    });

    testWidgets('should return correct initial camera position', (
      WidgetTester tester,
    ) async {
      final expectedPosition = GoogleMaps.LatLng(
        initialCameraPosition.target.latitude,
        initialCameraPosition.target.longitude,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Atlas(initialCameraPosition: initialCameraPosition),
        ),
      );
      await tester.pumpAndSettle();

      final FakePlatformGoogleMap platformGoogleMap =
          fakePlatformViewsController.lastCreatedView;

      expect(expectedPosition, platformGoogleMap.cameraPosition.target);
      expect(12, platformGoogleMap.cameraPosition.zoom);
      expect(0, platformGoogleMap.cameraPosition.tilt);
      expect(0, platformGoogleMap.cameraPosition.bearing);
    });
  });
}
