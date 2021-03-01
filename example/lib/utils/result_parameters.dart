import 'package:atlas/atlas.dart';

class ResultParameters {
  final CameraPosition cameraPosition;
  final Set<Marker> markers;

  const ResultParameters({
    this.cameraPosition,
    this.markers,
  });
}
