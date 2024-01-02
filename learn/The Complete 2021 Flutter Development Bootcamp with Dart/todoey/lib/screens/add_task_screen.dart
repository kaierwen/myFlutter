import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String _title = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(
      builder: (BuildContext context, TaskModel taskModel, Widget? child) {
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
                  style:
                      TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
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
                    taskModel.addTask(_title);
                    Navigator.pop(context);
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
      },
    );
  }
}
