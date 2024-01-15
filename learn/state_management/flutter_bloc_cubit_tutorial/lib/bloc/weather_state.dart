part of 'weather_bloc.dart';

sealed class WeatherState {
  const WeatherState();
}

final class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

final class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

final class WeatherLoaded extends WeatherState {
  final Weather weather;
  const WeatherLoaded({required this.weather});
}

final class WeatherError extends WeatherState {
  final String message;
  const WeatherError({required this.message});
}
