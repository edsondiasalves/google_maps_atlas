import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_atlas/google_atlas.dart';
import 'package:google_maps_atlas_example/widgets/settings_side_menu.dart';

import 'bloc/configuration_bloc.dart';

void main() {
  AtlasProvider.instance = GoogleAtlas();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (BuildContext context) => ConfigurationBloc(),
        child: GoogleAtlasSample(),
      ),
    );
  }
}

class GoogleAtlasSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AtlasController _atlasController;

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Google Maps Provider'),
      ),
      drawer: SettingsSideMenu(),
      body: MultiBlocListener(
        listeners: [
          BlocListener<ConfigurationBloc, ConfigurationState>(
            listenWhen: (previous, current) => current is CameraChangedState,
            listener: (context, state) {
              _atlasController.moveCamera(state.currentCameraPosition);
            },
          ),
        ],
        child: BlocBuilder<ConfigurationBloc, ConfigurationState>(
          buildWhen: (previous, current) =>
              current is InitialPositionState || current is MarkerLoadedState,
          builder: (context, state) {
            return Atlas(
              key: UniqueKey(),
              initialCameraPosition: state.initialCameraPosition,
              markers: state.markers,
              onMapCreated: (AtlasController atlasController) {
                _atlasController = atlasController;

                _updateBounds(state, _atlasController);
              },
            );
          },
        ),
      ),
    );
  }

  void _updateBounds(
    ConfigurationState state,
    AtlasController _atlasController,
  ) {
    if (state.markers.isNotEmpty) {
      var maxLatitude = state.markers.first.position.latitude;
      var minLatitude = state.markers.first.position.latitude;
      var maxLongitude = state.markers.first.position.longitude;
      var minLongitude = state.markers.first.position.longitude;

      state.markers.forEach((current) {
        if (current.position.latitude > maxLatitude) {
          maxLatitude = current.position.latitude;
        }
        if (current.position.latitude < minLatitude) {
          minLatitude = current.position.latitude;
        }
        if (current.position.longitude > maxLongitude) {
          maxLongitude = current.position.longitude;
        }
        if (current.position.longitude < minLongitude) {
          minLongitude = current.position.longitude;
        }
      });

      LatLngBounds bounds = LatLngBounds(
        northeast: LatLng(latitude: maxLatitude, longitude: maxLongitude),
        southwest: LatLng(latitude: minLatitude, longitude: minLongitude),
      );

      _atlasController.updateBounds(bounds, 50);
    }
  }
}
