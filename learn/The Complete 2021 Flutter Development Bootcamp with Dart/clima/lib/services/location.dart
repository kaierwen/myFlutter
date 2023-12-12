import 'package:geolocator/geolocator.dart';

import 'networking.dart';

class Location {
  void getCurrentLocation() async {
    print('object');
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print('position = $position');
      getWeather(position);
    } catch (e) {
      print('exception: $e');
    }
    // return Future.value(position);
  }

  void getWeather(Position position) async {
    var weatherUri = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': position.latitude.toString(),
      'lon': position.longitude.toString(),
      'units': 'metric',
      'appid': 'a57ec25fa9518f1ad890e63597ab1765',
    });
    var result = await NetworkHelper(weatherUri).getData();
    print('data = $result');
    var main = result['weather'][0]['main'];
    var temp = result['main']['temp'];
    var name = result['name'];
    var id = result['weather'][0]['id'];
    print('main = $main');
    print('temp = $temp');
    print('name = $name');
    print('id = $id');
  }
}
