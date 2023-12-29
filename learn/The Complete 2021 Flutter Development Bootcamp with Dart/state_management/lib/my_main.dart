import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),
          ),
          body: Column(
            children: [
              /// 在MyApp这里调用Provider.of<Data>(context, listen: false).changeName
              /// (value),
              /// 将会报错，报错信息如下：
              /// The following ProviderNotFoundException was thrown while calling onChanged:
              /// Error: Could not find the correct Provider<Data> above this MyApp Widget
              ///
              // TextField(
              //   onChanged: (value) =>
              //       Provider.of<Data>(context, listen: false).changeName(value),
              // ),
              MyTextField(),
              Level1(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) =>
          Provider.of<Data>(context, listen: false).changeName(value),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).name);
  }
}

class Level1 extends StatelessWidget {
  const Level1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Level2();
  }
}

class Level2 extends StatelessWidget {
  const Level2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Level3();
  }
}

class Level3 extends StatelessWidget {
  const Level3({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).name);
  }
}

class Data with ChangeNotifier {
  // int _data = 0;
  // int get data => _data;
  // void increment() {
  //   _data++;
  //   notifyListeners();
  // }

  String _name = 'some name';

  String get name => _name;

  void changeName(String newName) {
    _name = newName;
    notifyListeners();
  }
}
