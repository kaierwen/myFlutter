import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/widgets/task_list.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(name: 'task 1'),
    Task(name: 'task 2'),
    Task(name: 'task 3'),
    Task(name: 'task 4'),
    Task(name: 'task 5'),
    Task(name: 'task 5'),
    Task(name: 'task 5'),
    Task(name: 'task 5'),
    Task(name: 'task 5'),
    Task(name: 'task 5'),
    Task(name: 'task 5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Column(
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
                    '${tasks.length} tasks',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: kTopDecoration,
                child: TaskList(
                  tasks: tasks,
                  onChanged: (index) {
                    // setState(() {
                    //   tasks[index].toggle();
                    // });
                  },
                ),
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
          );
        },
        child: Icon(Icons.add, color: Colors.white, size: 32.0),
        backgroundColor: Colors.lightBlueAccent,
        shape: CircleBorder(),
      ),
    );
  }
}
