import 'package:flutter/material.dart';

const allMargin = EdgeInsets.all(16.0);

class ReuseableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  Function? onPress;

  ReuseableCard({required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPress != null) {
          onPress!();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: allMargin,
        child: cardChild,
      ),
    );
  }
}
