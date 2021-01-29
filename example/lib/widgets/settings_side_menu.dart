import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_atlas_example/bloc/configuration_bloc.dart';
import 'package:google_maps_atlas_example/utils/constants.dart';

class SettingsSideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 180,
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Google Maps Settings'),
            onTap: () => {},
          ),
          Container(
            margin: EdgeInsets.only(
              left: 15,
            ),
            child: Text('Initial Position'),
          ),
          BlocBuilder<ConfigurationBloc, ConfigurationState>(
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        RadioListTile<City>(
                          title: const Text('Lisbon'),
                          dense: true,
                          value: City.Lisbon,
                          groupValue: state.city,
                          onChanged: (City value) {
                            BlocProvider.of<ConfigurationBloc>(context)
                                .add(ChangeInitialPositionStarted(city: value));
                          },
                        ),
                        RadioListTile<City>(
                          title: const Text('São Paulo'),
                          dense: true,
                          value: City.SaoPaulo,
                          groupValue: state.city,
                          onChanged: (City value) {
                            BlocProvider.of<ConfigurationBloc>(context)
                                .add(ChangeInitialPositionStarted(city: value));
                          },
                        ),
                        RadioListTile<City>(
                          title: const Text('Tokyo'),
                          dense: true,
                          value: City.Tokyo,
                          groupValue: state.city,
                          onChanged: (City value) {
                            BlocProvider.of<ConfigurationBloc>(context)
                                .add(ChangeInitialPositionStarted(city: value));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
