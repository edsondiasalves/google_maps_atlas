part of 'configuration_bloc.dart';

@immutable
abstract class ConfigurationState {
  final City city;

  ConfigurationState({this.city});
}

class ConfigurationInitial extends ConfigurationState {
  ConfigurationInitial() : super(city: City.Lisbon);
}

class InitialPositionState extends ConfigurationState {
  InitialPositionState({City city}) : super(city: city);
}
