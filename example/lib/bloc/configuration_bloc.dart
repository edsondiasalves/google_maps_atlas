import 'dart:async';

import 'package:atlas/atlas.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_atlas_example/utils/constants.dart';
import 'package:google_maps_atlas_example/utils/extensions.dart';
import 'package:google_maps_atlas_example/utils/markers_configuration.dart';
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
        initialCity: event.initialCity,
        initialCameraPosition: event.initialCity.toCameraPosition(),
      );
    } else if (event is ChangeCameraPositionStarted) {
      yield CameraChangedState(
        initialCity: state.initialCity,
        currentCity: event.currentCity,
        currentCameraPosition: event.currentCity.toCameraPosition(),
      );
    } else if (event is AddMarkersStarted) {
      final result = ResultEngine().getResult(event.placePosition);

      yield MarkerLoadedState(
        initialCity: state.initialCity,
        currentCity: state.currentCity,
        initialCameraPosition: result.cameraPosition,
        currentMarkersPlace: event.placePosition,
        markers: result.markers,
      );
    }
  }
}
