part of 'weather_bloc.dart';

abstract class WeatherEvent {
  const WeatherEvent();
}

class GetWeatherEvent extends WeatherEvent {
  final String cityName;
  const GetWeatherEvent(this.cityName);
}
