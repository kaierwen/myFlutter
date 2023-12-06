import 'package:bmi_calculator_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E22),
        sliderTheme: kSliderTheme,
      ),
      home: InputPage(),
    );
  }
}
