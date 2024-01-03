import 'package:flutter/material.dart';

class TimePageManager {
  ValueNotifier<String> countDown = ValueNotifier('00:10');
  ValueNotifier<TimePageState> state = ValueNotifier(TimePageState.init);

  void reset() {
    state.value = TimePageState.init;
    countDown.value = '00:10';
  }

  void start() {
    state.value = TimePageState.started;
    countDown.value = '00:10';
  }

  void pause() {
    state.value = TimePageState.paused;
  }

  void finish() {
    state.value = TimePageState.finished;
    countDown.value = '00:00';
  }
}

enum TimePageState { init, started, paused, finished }
