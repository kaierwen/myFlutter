import 'package:flutter/material.dart';

const kBottomContainerHeight = 80.0;
const kActiveCardColour = Color(0xFF1D1F33);
const kInactiveCardColour = Color(0xFF111328);
const kBottomContainerColour = Color(0xFFEB1555);
const kTextColour = Color(0xFF8D8E98);
const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: kTextColour,
);
const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
  color: Colors.white,
);
const kGap = SizedBox(
  height: 15.0,
);
const kSliderTheme = SliderThemeData(
  activeTrackColor: Colors.white,
  inactiveTrackColor: Color(0xFF8D8E98),
  thumbColor: Color(0xFFEB1555),
  overlayColor: Color(0x29EB1555), // 16% opacity
  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
);
