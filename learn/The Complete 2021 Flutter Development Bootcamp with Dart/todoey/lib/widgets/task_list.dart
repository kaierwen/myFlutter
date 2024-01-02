import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_model.dart';
import 'package:todoey/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(
      builder: (BuildContext context, TaskModel taskModel, Widget? child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
            itemCount: taskModel.taskCount,
            itemBuilder: (context, index) {
              return GestureDetector(
                onLongPress: () {
                  taskModel.deleteAt(index);
                },
                child: TaskTile(
                  task: taskModel.tasks[index],
                  onChanged: (value) {
                    taskModel.updateTask(index);
                    // Provider.of<TaskModel>(context, listen: false)
                    //     .updateTask(index);
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
