import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_tutorial/cubit/weather_cubit.dart';
import 'package:flutter_bloc_cubit_tutorial/data/model/weather.dart';
import 'package:flutter_bloc_cubit_tutorial/data/weather_repository.dart';

class WeatherSearchPage extends StatefulWidget {
  @override
  _WeatherSearchPageState createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Search"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        // TODO: Implement with cubit
        // child: BlocBuilder<WeatherCubit, WeatherState>(
        //   builder: (context, state) {
        //     debugPrint("Current state: $state");
        //     if (state is WeatherInitial) {
        //       return buildInitialInput();
        //     } else if (state is WeatherLoading) {
        //       return buildLoading();
        //     } else if (state is WeatherLoaded) {
        //       return buildColumnWithData(state.weather);
        //     } else if (state is WeatherError) {
        //       /// 会报错，所以才使用BlocConsumer的listener
        //       /// The showSnackBar() method was called during build, which is prohibited as showing snack bars requires updating state. Updating state is not possible during build.
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         SnackBar(
        //           content: Text(state.message),
        //         ),
        //       );
        //       return buildInitialInput();
        //     } else {
        //       return buildInitialInput();
        //     }
        //   },
        // ),
        child: BlocConsumer<WeatherCubit, WeatherState>(
          builder: (context, state) {
            debugPrint("builder Current state: $state");
            if (state is WeatherInitial) {
              return buildInitialInput();
            } else if (state is WeatherLoading) {
              return buildLoading();
            } else if (state is WeatherLoaded) {
              return buildColumnWithData(state.weather);
            } else {
              return buildInitialInput();
            }
          },
          listener: (context, state) {
            debugPrint("listener Current state: $state");
            if (state is WeatherError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    return Center(
      child: CityInputField(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildColumnWithData(Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          weather.cityName,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          // Display the temperature with 1 decimal place
          "${weather.temperatureCelsius.toStringAsFixed(1)} °C",
          style: TextStyle(fontSize: 80),
        ),
        CityInputField(),
      ],
    );
  }
}

class CityInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitCityName(context, value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void submitCityName(BuildContext context, String cityName) async {
    // TODO: Get weather for the city
    context.read<WeatherCubit>().fetchWeather(cityName);
  }
}
