import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';

import 'google_maps_provider.dart';

class GoogleAtlas extends Provider {
  @override
  Widget build({
    CameraPosition initialCameraPosition,
    Set<Marker> markers,
    Set<Circle> circles,
    Set<Polygon> polygons,
    Set<Polyline> polylines,
    onTap,
    onPoiTap,
    onLongPress,
    onMapCreated,
    onCameraPositionChanged,
    onLocationChanged,
    onPan,
    bool showMyLocation,
    bool showMyLocationButton,
    bool followMyLocation,
    MapType mapType,
    bool showTraffic,
    MapLanguage mapLanguage,
  }) {
    return GoogleMapsProvider(
      initialCameraPosition: initialCameraPosition,
      onMapCreated: onMapCreated,
    );
  }
}
