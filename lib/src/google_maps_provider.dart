import 'package:atlas/atlas.dart' as Atlas;
import 'package:flutter/material.dart';
import 'package:google_maps_atlas/src/google_maps_atlas_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'utils.dart';

class GoogleMapsProvider extends StatefulWidget {
  final Atlas.CameraPosition initialCameraPosition;
  final Atlas.ArgumentCallback<Atlas.AtlasController> onMapCreated;
  final Set<Atlas.Marker> markers;

  GoogleMapsProvider({
    this.initialCameraPosition,
    this.onMapCreated,
    this.markers,
  });

  @override
  _GoogleMapsProviderState createState() => _GoogleMapsProviderState();
}

class _GoogleMapsProviderState extends State<GoogleMapsProvider> {
  Atlas.CameraPosition get initialCameraPosition =>
      widget.initialCameraPosition;

  Atlas.ArgumentCallback<Atlas.AtlasController> get onMapCreated =>
      widget.onMapCreated;

  Set<Atlas.Marker> get markers => widget.markers;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Set<Marker>>(
      future: markers.toGoogleMapsSetMarkers(),
      initialData: Set<Marker>(),
      builder: (context, snapshot) {
        return GoogleMap(
          initialCameraPosition:
              initialCameraPosition.toGoogleMapsCameraPosition(),
          onMapCreated: _onMapCreated,
          markers: snapshot.data,
        );
      },
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    onMapCreated?.call(
      GoogleMapsAtlasController(controller: controller),
    );
  }
}
