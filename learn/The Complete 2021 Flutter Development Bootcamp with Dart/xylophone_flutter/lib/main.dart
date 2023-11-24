import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound({int soundNumber = 1}) {
    final player = AudioCache();
    player.loadAsset('note$soundNumber.wav');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildKey(color: Colors.red, soundNumber: 1, note: 'note1'),
                buildKey(color: Colors.orange, soundNumber: 2, note: 'note2'),
                buildKey(color: Colors.yellow, soundNumber: 3, note: 'note3'),
                buildKey(color: Colors.green, soundNumber: 4, note: 'note4'),
                buildKey(color: Colors.teal, soundNumber: 5, note: 'note5'),
                buildKey(color: Colors.blue, soundNumber: 6, note: 'note6'),
                buildKey(color: Colors.white, soundNumber: 7, note: 'note7'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildKey(
      {Color color = Colors.red, int soundNumber = 1, String note = 'note1'}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(soundNumber: soundNumber);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
        child: Text(note),
      ),
    );
  }
}
