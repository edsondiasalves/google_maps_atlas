import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_atlas/src/google_atlas.dart';

void main() {
  AtlasProvider.instance = GoogleAtlas();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: Atlas(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            latitude: 52.530932,
            longitude: 13.384915,
          ),
        ),
      ),
    );
  }
}
