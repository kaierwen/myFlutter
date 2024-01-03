import 'package:flutter/material.dart';
import 'package:state_management_minimalists/pages/time_page/services/service_locator.dart';
import 'package:state_management_minimalists/pages/time_page/time_page.dart';

void main() {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Count Down Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TimePage(),
    );
  }
}
