import 'package:flutter/material.dart';
import 'package:state_management_minimalists/pages/time_page/services/service_locator.dart';
import 'package:state_management_minimalists/pages/time_page/time_page_manager.dart';

class CountDownText extends StatelessWidget {
  const CountDownText({super.key});

  @override
  Widget build(BuildContext context) {
    final stateManager = getIt<TimePageManager>();
    return ValueListenableBuilder(
        valueListenable: stateManager.countDownText,
        builder: (context, value, child) {
          return Text(
            value,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          );
        });
  }
}
