part of 'configuration_bloc.dart';

@immutable
abstract class ConfigurationEvent {}

class ChangeInitialPositionStarted extends ConfigurationEvent {
  final City initialCity;

  ChangeInitialPositionStarted({this.initialCity});
}

class ChangeCameraPositionStarted extends ConfigurationEvent {
  final City currentCity;

  ChangeCameraPositionStarted({this.currentCity});
}

class AddMarkersStarted extends ConfigurationEvent {
  final MarkerPlace placePosition;

  AddMarkersStarted({this.placePosition});
}
