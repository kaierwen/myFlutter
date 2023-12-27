import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class TaskTile extends StatelessWidget {
  Task task;
  Function(bool?) onChanged;
  TaskTile({required this.task, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CheckboxListTile(
        value: task.isDone,
        onChanged: onChanged,
        title: Text(task.name,
            style: TextStyle(
              decoration: task.isDone ? TextDecoration.lineThrough : null,
            )),
        activeColor: Colors.lightBlueAccent,
      ),
    );
  }
}
