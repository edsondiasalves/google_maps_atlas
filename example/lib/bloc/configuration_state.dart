part of 'configuration_bloc.dart';

@immutable
abstract class ConfigurationState extends Equatable {
  final City initialCity;
  final CameraPosition initialCameraPosition;
  final City currentCity;
  final CameraPosition currentCameraPosition;
  final MarkerPlace currentMarkersPlace;
  final Set<Marker> markers;

  ConfigurationState({
    this.initialCity,
    this.initialCameraPosition,
    this.currentCity,
    this.currentCameraPosition,
    this.currentMarkersPlace,
    this.markers,
  });

  @override
  List<Object> get props => [
        initialCity,
        initialCameraPosition,
        currentCity,
        currentCameraPosition,
        currentMarkersPlace,
        markers,
      ];
}

class ConfigurationInitial extends ConfigurationState {
  ConfigurationInitial()
      : super(
          initialCity: City.Lisbon,
          initialCameraPosition: City.Lisbon.toCameraPosition(),
          currentCity: City.Lisbon,
          currentCameraPosition: City.Lisbon.toCameraPosition(),
        );
}

class InitialPositionState extends ConfigurationState {
  InitialPositionState({
    City initialCity,
    CameraPosition initialCameraPosition,
  }) : super(
          initialCity: initialCity,
          initialCameraPosition: initialCameraPosition,
          currentCity: initialCity,
          currentCameraPosition: initialCameraPosition,
        );
}

class CameraChangedState extends ConfigurationState {
  CameraChangedState({
    City initialCity,
    CameraPosition initialCameraPosition,
    City currentCity,
    CameraPosition currentCameraPosition,
  }) : super(
          initialCity: initialCity,
          initialCameraPosition: initialCameraPosition,
          currentCity: currentCity,
          currentCameraPosition: currentCameraPosition,
        );
}

class MarkerLoadedState extends ConfigurationState {
  MarkerLoadedState({
    City initialCity,
    CameraPosition initialCameraPosition,
    City currentCity,
    CameraPosition currentCameraPosition,
    MarkerPlace currentMarkersPlace,
    Set<Marker> markers,
  }) : super(
          initialCity: initialCity,
          initialCameraPosition: initialCameraPosition,
          currentCity: currentCity,
          currentCameraPosition: currentCameraPosition,
          currentMarkersPlace: currentMarkersPlace,
          markers: markers,
        );
}
