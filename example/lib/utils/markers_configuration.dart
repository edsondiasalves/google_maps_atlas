import 'package:atlas/atlas.dart';
import 'package:google_maps_atlas_example/utils/constants.dart';
import 'package:google_maps_atlas_example/utils/extensions.dart';
import 'package:google_maps_atlas_example/utils/result_parameters.dart';

class ResultEngine {
  ResultParameters getResult(MarkerPlace place) {
    Set<Marker> markers = _getNewYorkPizzaPlacesMarkers();
    LatLng coordinates = getMarkerPlaceCoordinates(place);
    double zoom = 12;
    switch (place) {
      case MarkerPlace.NewYork:
        zoom = 12;
        markers = _getNewYorkPizzaPlacesMarkers();
        break;
      case MarkerPlace.London:
        zoom = 13;
        markers = _getLondonMuseumMarkers();
        break;
      case MarkerPlace.Beijing:
        zoom = 12.5;
        markers = _getBeijingTempleMarkers();
        break;
      default:
        markers = _getNewYorkPizzaPlacesMarkers();
        break;
    }

    return ResultParameters(
      cameraPosition: CameraPosition(
        target: coordinates,
        zoom: zoom,
      ),
      markers: markers,
    );
  }

  Set<Marker> _getNewYorkPizzaPlacesMarkers() {
    List<Marker> markers = [];
    final String pizzaIcon = "";

    markers.add(
      Marker(
        id: "Dona Bella Pizza - 154 Church St, New York, NY 10007, United States",
        position: LatLng(
          latitude: 40.71611489211848,
          longitude: -74.0081640104258,
        ),
      ),
    );

    markers.add(
      Marker(
        id: "Lunetta - 245 3rd Ave, New York, NY 10010, United States",
        position: LatLng(
          latitude: 40.739491715365226,
          longitude: -73.98499904931326,
        ),
      ),
    );

    markers.add(
      Marker(
        id: "Mario's Pizzeria - 222 Hoyt St, Brooklyn, NY 11217, United States",
        position: LatLng(
          latitude: 40.6853547207549,
          longitude: -73.98943528883578,
        ),
      ),
    );

    markers.add(
      Marker(
        id: "Tino's Artisan Pizza Co. - 199 Warren St, Jersey City, NJ 07302, United States",
        position: LatLng(
          latitude: 40.71522249283857,
          longitude: -74.03987719217072,
        ),
      ),
    );

    markers.add(
      Marker(
        id: "Francesco's Pizza - 186 Columbus Ave, New York, NY 10023, United States",
        position: LatLng(
          latitude: 40.77563760816105,
          longitude: -73.98058744624487,
        ),
      ),
    );

    return Set.from(markers);
  }

  Set<Marker> _getLondonMuseumMarkers() {
    List<Marker> markers = [];

    markers.add(
      Marker(
        id: "Churchill War Rooms - Clive Steps, King Charles St, London SW1A 2AQ, United Kingdom",
        position: LatLng(
          latitude: 51.50473100024499,
          longitude: -0.12901084925604245,
        ),
      ),
    );

    markers.add(
      Marker(
        id: "Museum of London - 150 London Wall, Barbican, London EC2Y 5HN, United Kingdom",
        position: LatLng(
          latitude: 51.5208142608732,
          longitude: -0.09666175072613924,
        ),
      ),
    );

    markers.add(
      Marker(
        id: "Imperial War Museum - Lambeth Rd, London SE1 6HZ, United Kingdom",
        position: LatLng(
          latitude: 51.499824415348776,
          longitude: -0.10981707614533068,
        ),
      ),
    );

    markers.add(
      Marker(
        id: "Glass Museum - Bermondsey St, Bermondsey, London SE1 3UD, United Kingdom",
        position: LatLng(
          latitude: 51.50318126244633,
          longitude: -0.08306530895701951,
        ),
      ),
    );

    markers.add(
      Marker(
        id: "Genius Treasure Museum - Pepper St, London SE1 0EL, United Kingdom",
        position: LatLng(
          latitude: 51.504367474749614,
          longitude: -0.09831070789469158,
        ),
      ),
    );

    return Set.from(markers);
  }

  Set<Marker> _getBeijingTempleMarkers() {
    List<Marker> markers = [];

    markers.add(
      Marker(
        id: "  Lama Temple - 12 Yonghegong St, Dongcheng, China, 100007",
        position: LatLng(
          latitude: 39.95450826446012,
          longitude: 116.41874689441009,
        ),
      ),
    );

    markers.add(
      Marker(
        id: "Temple Of Fire God At Huashi - Xihuanshi St, Chongwenmen, Dongcheng, Beijing, China",
        position: LatLng(
          latitude: 39.9187170148563,
          longitude: 116.42250872975887,
        ),
      ),
    );

    markers.add(
      Marker(
        id: "Temple of the Sun - Chaoyang, Beijing, China",
        position: LatLng(
          latitude: 39.92112301224457,
          longitude: 116.44434313936556,
        ),
      ),
    );

    markers.add(
      Marker(
        id: "Temple of Guanyu - Dongcheng, China",
        position: LatLng(
          latitude: 39.902540250987244,
          longitude: 116.39952352710203,
        ),
      ),
    );

    markers.add(
      Marker(
        id: "Zhaoxian Temple - 71 Beichang St, Xicheng District, Beijing, China",
        position: LatLng(
          latitude: 39.92507119951572,
          longitude: 116.39043847056215,
        ),
      ),
    );

    return Set.from(markers);
  }
}
