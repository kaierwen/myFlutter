import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskModel with ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy bread'),
    Task(name: 'Buy eggs'),
  ];

  /// 使用 UnmodifiableListView 创建不可变列表，使_tasks列表更安全，只通过 addTask 方法添加新元素，而不能通过其他方式添加新元素
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount => _tasks.length;

  void addTask(String taskTitle) {
    tasks.add(Task(name: 'name'));
    _tasks.add(Task(name: taskTitle));
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void deleteAt(int index) {
    if (index < 0 || index >= _tasks.length) {
      return;
    }
    _tasks.removeAt(index);
    notifyListeners();
  }

  void updateTask(int index) {
    _tasks[index].toggle();
    notifyListeners();
  }
}
