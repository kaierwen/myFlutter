import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_model.dart';
import 'package:todoey/screens/tasks_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskModel>(
      create: (BuildContext context) => TaskModel(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
