import 'package:flutter/material.dart';
import 'package:state_management_minimalists/pages/time_page/widget/count_down_text.dart';
import 'package:state_management_minimalists/pages/time_page/widget/state_buttons.dart';

class TimePage extends StatefulWidget {
  const TimePage({super.key});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Time Count Down'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CountDownText(),
              SizedBox(height: 20),
              StateButtons(),
            ],
          ),
        ));
  }
}
