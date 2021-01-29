part of 'configuration_bloc.dart';

@immutable
abstract class ConfigurationEvent {}

class ChangeInitialPositionStarted extends ConfigurationEvent {
  final City city;

  ChangeInitialPositionStarted({this.city});
}
