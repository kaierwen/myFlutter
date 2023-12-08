import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Location {
  double? latitude = 0.0;
  double? longitude = 0.0;

  Location({this.latitude, this.longitude});

  void getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position);
    } catch (e) {
      print('exception: $e');
    }
    // return Future.value(position);
  }

  void getWeather() async {
    http.Response response = await http
        .get(Uri.https('samples.openweathermap.org', '/data/2.5/weather', {
      'lat': '35',
      'lon': '139',
      'appid': 'b6907d289e10d714a6e88b30761fae22',
    }));
    print(response.body);
  }
}
