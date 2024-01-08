import 'package:flutter/material.dart';
import 'package:timer/ticker.dart';

void main() {
  const Ticker().tick(ticks: 10).listen((tick) {
    debugPrint('tick => $tick');
  });
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
