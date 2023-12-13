import 'package:clima/services/networking.dart';

class WeatherModel {
  Future getWeather2(
      {String? latitude = '23.654914',
      String? longitude = '116.636686'}) async {
    var weatherUri = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': latitude,
      'lon': longitude,
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
    return result;
  }

  Future getCityWeather(String cityName) async {
    var weatherUri = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': cityName,
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
    return result;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
