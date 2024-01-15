import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_cubit_tutorial/data/model/weather.dart';
import 'package:flutter_bloc_cubit_tutorial/data/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;
  WeatherBloc(this._weatherRepository) : super(const WeatherInitial()) {
    on<WeatherEvent>(_fetchWeather);
  }

  /// https://github.com/felangel/bloc/issues/2526#issuecomment-860886596
  void _fetchWeather(WeatherEvent event, Emitter<WeatherState> emit) async {
    if (event is GetWeatherEvent) {
      emit(const WeatherLoading());
      try {
        final weather = await _weatherRepository.fetchWeather(event.cityName);
        emit(WeatherLoaded(weather: weather));
      } on NetworkException {
        emit(const WeatherError(
            message: "Couldn't fetch weather. Is the device online?"));
      }
    }
  }
}
