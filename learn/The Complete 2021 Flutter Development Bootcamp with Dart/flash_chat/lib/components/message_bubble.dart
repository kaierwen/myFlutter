import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  String sender = '';
  String text = '';

  MessageBubble({
    required this.sender,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(sender),
          Material(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 80.0, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
