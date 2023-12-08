import 'dart:io';

/// Starting Code for Futures/Async/Await Demo
/// https://gist.github.com/angelabauer/c19c42b7795a185d2113f3b47263d2c0
void main() {
  performTasks();
}

void performTasks() async {
  task1();
  // print(task2()); // 打印出: Instance of 'Future<String>'
  // print(await task2()); // 打印出： task 2 data，task2()返回的是Future<String>中的内容

  String result = await task2();
  task3(result); // task3接收来自task2的返回值
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  // sleep(Duration(seconds: 2)); // 同步暂停
  // String result = 'task 2 data';
  // print('Task 2 complete');

  // 异步暂停，可跳过执行
  // Future.delayed(Duration(seconds: 2), () {
  //   String result = 'task 2 data';
  //   print('Task 2 complete');
  // });

  String result = '000';

  await Future.delayed(Duration(seconds: 2), () {
    result = 'task 2 data';
    print('Task 2 complete');
  });

  return Future.value(result);
}

void task3(String task2result) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2result');
}
