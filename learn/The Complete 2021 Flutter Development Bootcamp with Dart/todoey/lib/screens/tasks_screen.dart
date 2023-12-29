import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/models/task_model.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/widgets/task_list.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskModel>(
      create: (context) => TaskModel(),
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                  top: 60.0,
                  bottom: 30.0,
                ),
                child: Top(),
              ),
              Expanded(
                child: Container(
                  decoration: kTopDecoration,
                  child: TaskList(),
                  // child: TaskList(
                  //   tasks: Provider.of<TaskModel>(context).tasks,
                  //   onChanged: (value, index) {
                  //     Provider.of<TaskModel>(context).updateTask(index);
                  //     // setState(() {
                  //     //   tasks[index].isDone = value;
                  //     // });
                  //   },
                  // ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => AddTaskScreen(),
              // builder: (context) => AddTaskScreen(addTaskCallback: (value) {
              //   Provider.of<TaskModel>(context, listen: false)
              //       .addTask(Task(name: value));
              //   // setState(() {
              //   //   tasks.add(Task(name: value));
              //   // });
              //   Navigator.pop(context);
              // }),
            );
          },
          child: Icon(Icons.add, color: Colors.white, size: 32.0),
          backgroundColor: Colors.lightBlueAccent,
          shape: CircleBorder(),
        ),
      ),
    );
  }
}

class Top extends StatelessWidget {
  const Top({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.0),
        CircleAvatar(
          radius: 35.0,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.list,
            size: 40.0,
            color: Colors.lightBlueAccent,
          ),
        ),
        Text(
          'Todoey',
          style: TextStyle(fontSize: 50.0, color: Colors.white),
        ),
        Text(
          '${Provider.of<TaskModel>(context).tasks.length} tasks',
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
