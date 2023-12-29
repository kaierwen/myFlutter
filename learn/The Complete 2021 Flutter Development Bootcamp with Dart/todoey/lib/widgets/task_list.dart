import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_model.dart';
import 'package:todoey/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: Provider.of<TaskModel>(context).tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
            task: Provider.of<TaskModel>(context).tasks[index],
            onChanged: (value) {
              Provider.of<TaskModel>(context, listen: false).updateTask(index);
            },
          );
        },
      ),
    );
  }
}
