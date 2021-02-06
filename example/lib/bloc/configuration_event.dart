part of 'configuration_bloc.dart';

@immutable
abstract class ConfigurationEvent {}

class ChangeInitialPositionStarted extends ConfigurationEvent {
  final City city;

  ChangeInitialPositionStarted({this.city});
}

class ChangeCameraPositionStarted extends ConfigurationEvent {
  final City city;

  ChangeCameraPositionStarted({this.city});
}
