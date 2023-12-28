import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';

class AddTaskScreen extends StatefulWidget {
  final Function(String) addTaskCallback;

  AddTaskScreen({required this.addTaskCallback});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String _title = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: kTopDecoration,
        child: Column(
          children: [
            Text(
              'Add Task',
              style: TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
            ),
            TextField(
              autofocus: true,
              onChanged: (value) {
                _title = value;
              },
            ),
            SizedBox(height: 20),
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.lightBlueAccent)),
              onPressed: () {
                widget.addTaskCallback(_title);
              },
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
