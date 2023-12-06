import 'package:bmi_calculator_flutter/constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  IconData icon;
  Function() onPressed;
  RoundIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6,
      fillColor: kTextColour,
      shape: const CircleBorder(),
      constraints: const BoxConstraints(minWidth: 56.0, minHeight: 56.0),
      child: Icon(icon),
    );
  }
}
