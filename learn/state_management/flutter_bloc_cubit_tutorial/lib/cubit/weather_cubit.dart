import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_cubit_tutorial/data/model/weather.dart';
import 'package:flutter_bloc_cubit_tutorial/data/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;
  WeatherCubit(this._weatherRepository) : super(const WeatherInitial());

  void loading() {
    emit(const WeatherLoading());
  }

  void loaded(Weather weather) {
    emit(WeatherLoaded(weather: weather));
  }

  void loadFailed(String message) {
    emit(WeatherError(message: message));
  }

  void fetchWeather(String cityName) async {
    try {
      loading();
      Weather weather = await _weatherRepository.fetchWeather(cityName);
      loaded(weather);
    } on NetworkException {
      loadFailed("Couldn't fetch weather. Is the device online?");
    }
  }
}
