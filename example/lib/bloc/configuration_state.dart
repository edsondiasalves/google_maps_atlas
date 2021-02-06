part of 'configuration_bloc.dart';

@immutable
abstract class ConfigurationState extends Equatable {
  final City initialPosition;
  final City currentPosition;

  ConfigurationState({
    this.initialPosition,
    this.currentPosition,
  });

  @override
  List<Object> get props => [
        initialPosition,
        currentPosition,
      ];
}

class ConfigurationInitial extends ConfigurationState {
  ConfigurationInitial()
      : super(
          initialPosition: City.Lisbon,
          currentPosition: City.Lisbon,
        );
}

class InitialPositionState extends ConfigurationState {
  InitialPositionState({City initialPosition})
      : super(
          initialPosition: initialPosition,
          currentPosition: initialPosition,
        );
}

class CameraChangedState extends ConfigurationState {
  CameraChangedState({City currentPosition, City initialPosition})
      : super(
          currentPosition: currentPosition,
          initialPosition: initialPosition,
        );
}
