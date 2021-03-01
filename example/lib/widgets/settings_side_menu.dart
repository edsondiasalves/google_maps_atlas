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
          BlocBuilder<ConfigurationBloc, ConfigurationState>(
            builder: (context, state) {
              return Column(
                children: [
                  _groupTitle(
                    text: 'Initial Position',
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  ..._buildCityList(
                    context: context,
                    city: state.initialCity,
                    onChangeCity: onChangeInitialPosition,
                  ),
                  _groupTitle(
                    text: 'Move Camera',
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                  ),
                  ..._buildCityList(
                    context: context,
                    city: state.currentCity,
                    onChangeCity: onChangeCameraPosition,
                  ),
                  _groupTitle(
                    text: 'Markers',
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                  ),
                  ..._buildMarkerPlaceList(
                    context: context,
                    placePosition: state.currentMarkersPlace,
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  Container _groupTitle({String text, EdgeInsets padding}) {
    return Container(
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
      padding: padding,
    );
  }

  List<Widget> _buildCityList({
    BuildContext context,
    City city,
    Function(BuildContext, City) onChangeCity,
  }) {
    List<Widget> cities = [];
    City.values.forEach((cityValue) => {
          cities.add(Container(
            height: 35,
            child: Row(
              children: [
                Radio(
                  value: cityValue,
                  groupValue: city,
                  onChanged: (City selectedCity) =>
                      onChangeCity(context, selectedCity),
                ),
                Text(cityValue.toString().split('.')[1]),
              ],
            ),
          ))
        });
    return cities;
  }

  final Function(BuildContext, City) onChangeInitialPosition = (
    BuildContext context,
    City value,
  ) {
    BlocProvider.of<ConfigurationBloc>(context).add(
      ChangeInitialPositionStarted(initialCity: value),
    );
  };

  final Function(BuildContext, City) onChangeCameraPosition = (
    BuildContext context,
    City value,
  ) {
    BlocProvider.of<ConfigurationBloc>(context).add(
      ChangeCameraPositionStarted(currentCity: value),
    );
  };

  List<Widget> _buildMarkerPlaceList({
    BuildContext context,
    MarkerPlace placePosition,
  }) {
    List<Widget> places = [];
    MarkerPlace.values.forEach((place) => {
          places.add(Container(
            height: 35,
            child: Row(
              children: [
                Radio(
                  value: place,
                  groupValue: placePosition,
                  onChanged: (MarkerPlace place) {
                    BlocProvider.of<ConfigurationBloc>(context).add(
                      AddMarkersStarted(placePosition: place),
                    );
                  },
                ),
                Text(place.toString().split('.')[1]),
              ],
            ),
          ))
        });
    return places;
  }
}
