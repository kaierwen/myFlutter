import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(bool, int) onChanged;
  const TaskList({required this.tasks, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
            task: tasks[index],
            onChanged: (value) {
              onChanged(value!, index);
            },
          );
        },
      ),
    );
  }
}
