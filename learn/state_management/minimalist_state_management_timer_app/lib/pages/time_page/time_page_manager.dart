import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

class TimePageManager {
  ValueNotifier<String> countDownText = ValueNotifier('00:10');
  ValueNotifier<TimePageState> state = ValueNotifier(TimePageState.init);
  CountdownTimer? _countDownTimer;
  int _currentTimeLeft = 10;

  void reset() {
    state.value = TimePageState.init;
    countDownText.value = '00:10';
    debugPrint('state => ${state.value}');
  }

  void start() {
    state.value = TimePageState.started;
    countDownText.value = '00:10';
    debugPrint('state => ${state.value}');
    if (_countDownTimer != null) {
    } else {
      _countDownTimer ??= CountdownTimer(
          const Duration(seconds: 10), const Duration(seconds: 1));
      _countDownTimer!.listen((timer) {
        _currentTimeLeft = 10 - timer.elapsed.inSeconds;
        countDownText.value = "00:0$_currentTimeLeft";
      }, onDone: () {
        debugPrint('countDown => ${countDownText.value}');
        _countDownTimer = null;
        finish();
      });
    }
  }

  void pause() {
    state.value = TimePageState.paused;
    debugPrint('state => ${state.value}');
  }

  void finish() {
    state.value = TimePageState.finished;
    countDownText.value = '00:00';
    debugPrint('state => ${state.value}');
  }
}

enum TimePageState { init, started, paused, finished }
