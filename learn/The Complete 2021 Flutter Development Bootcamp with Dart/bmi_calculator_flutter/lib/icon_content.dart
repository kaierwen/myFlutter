import 'package:flutter/material.dart';

const textColour = Color(0xFF8D8E98);
const textStyle = TextStyle(
  fontSize: 18.0,
  color: textColour,
);
const gap = SizedBox(
  height: 15.0,
);

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  const IconContent({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        gap,
        Text(
          label,
          style: textStyle,
        ),
      ],
    );
  }
}
