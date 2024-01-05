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
            if (value == TimePageState.init) ...[
              const StartButton(),
            ],
            if (value == TimePageState.started) ...[
              const PauseButton(),
              const SizedBox(width: 20),
              const ResetButton(),
            ],
            if (value == TimePageState.paused) ...[
              const StartButton(),
              const SizedBox(width: 20),
              const ResetButton(),
            ],
            if (value == TimePageState.finished) ...[
              const ResetButton(),
            ]
          ],
        );
      },
    );
  }
}

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        getIt<TimePageManager>().start();
      },
      child: const Icon(Icons.play_arrow),
    );
  }
}

class PauseButton extends StatelessWidget {
  const PauseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        getIt<TimePageManager>().pause();
      },
      child: const Icon(Icons.pause),
    );
  }
}

class ResetButton extends StatelessWidget {
  const ResetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        getIt<TimePageManager>().reset();
      },
      child: const Icon(Icons.replay),
    );
  }
}
