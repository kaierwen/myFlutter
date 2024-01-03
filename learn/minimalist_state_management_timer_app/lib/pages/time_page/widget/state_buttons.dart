import 'package:flutter/material.dart';
import 'package:state_management_minimalists/pages/time_page/services/service_locator.dart';
import 'package:state_management_minimalists/pages/time_page/time_page_manager.dart';

class StateButtons extends StatelessWidget {
  const StateButtons({super.key});

  @override
  Widget build(BuildContext context) {
    var timePageManager = getIt<TimePageManager>();
    return ValueListenableBuilder(
      valueListenable: timePageManager.state,
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: value != TimePageState.finished,
              child: GestureDetector(
                onTap: () {
                  timePageManager.start();
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Visibility(
              visible: value != TimePageState.init,
              child: GestureDetector(
                onTap: () {
                  timePageManager.finish();
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.restart_alt,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
