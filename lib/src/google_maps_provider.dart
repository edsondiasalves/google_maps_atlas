import 'dart:async';

import 'package:atlas/atlas.dart' as atlas;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsProvider extends StatefulWidget {
  final atlas.CameraPosition initialCameraPosition;

  GoogleMapsProvider({this.initialCameraPosition});

  @override
  _GoogleMapsProviderState createState() => _GoogleMapsProviderState();
}

class _GoogleMapsProviderState extends State<GoogleMapsProvider> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(
          widget.initialCameraPosition.target.latitude,
          widget.initialCameraPosition.target.longitude,
        ),
        zoom: widget.initialCameraPosition.zoom,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
