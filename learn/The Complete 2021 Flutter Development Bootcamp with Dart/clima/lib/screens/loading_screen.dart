import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // void getWeather() async {
  //   http.Response response = await http
  //       .get(Uri.https('api.openweathermap.org', '/data/2.5/weather', {
  //     'lat': '35',
  //     'lon': '139',
  //     'appid': 'a57ec25fa9518f1ad890e63597ab1765',
  //   }));
  //   var statusCode = response.statusCode;
  //   if (statusCode == 200) {
  //     var body = response.body;
  //     var result = jsonDecode(body);
  //     var main = result['weather'][0]['main'];
  //     var temp = result['main']['temp'];
  //     var name = result['name'];
  //     var id = result['weather'][0]['id'];
  //     print('main = $main');
  //     print('temp = $temp');
  //     print('name = $name');
  //     print('id = $id');
  //   } else {
  //     print('error statusCode = $statusCode');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    var location = Location();
    location.getCurrentLocation();
    // print('weather -> $weather.body');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // getWeather();
            // print(getLocation());
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
