import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_atlas_example/utils/constants.dart';
import 'package:meta/meta.dart';

part 'configuration_event.dart';
part 'configuration_state.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  ConfigurationBloc() : super(ConfigurationInitial());

  @override
  Stream<ConfigurationState> mapEventToState(
    ConfigurationEvent event,
  ) async* {
    if (event is ChangeInitialPositionStarted) {
      yield InitialPositionState(
        initialPosition: event.city,
      );
    } else if (event is ChangeCameraPositionStarted) {
      yield CameraChangedState(
        currentPosition: event.city,
        initialPosition: state.initialPosition,
      );
    }
  }
}
