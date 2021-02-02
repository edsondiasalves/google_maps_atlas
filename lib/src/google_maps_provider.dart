import 'package:atlas/atlas.dart' as atlas;
import 'package:flutter/material.dart';
import 'package:google_maps_atlas/src/google_atlas_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'utils.dart';

class GoogleMapsProvider extends StatefulWidget {
  final atlas.CameraPosition initialCameraPosition;
  final ArgumentCallback<atlas.AtlasController> onMapCreated;

  GoogleMapsProvider({this.initialCameraPosition, this.onMapCreated});

  @override
  _GoogleMapsProviderState createState() => _GoogleMapsProviderState();
}

class _GoogleMapsProviderState extends State<GoogleMapsProvider> {
  atlas.CameraPosition get initialCameraPosition =>
      widget.initialCameraPosition;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: initialCameraPosition.toGoogleMapsCameraPosition(),
      onMapCreated: (GoogleMapController controller) {
        widget.onMapCreated.call(
          GoogleAtlasController(controller: controller),
        );
      },
    );
  }
}
