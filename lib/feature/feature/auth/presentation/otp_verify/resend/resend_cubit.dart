import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc/core/constant/app_constant.dart';

enum CountdownState {
  idle, // Timer is not running
  running, // Timer is running
  stopped, // Timer is stopped (completed)
}

class CountdownCubit extends Cubit<Map<String, dynamic>> {
  Timer? _timer;
  int _timeLeft = AppConstant.otpRetryLimit;

  CountdownCubit()
    : super({
        'state': CountdownState.idle,
        'timeLeft': AppConstant.otpRetryLimit,
      });

  void startCountdown() {
    _timeLeft = AppConstant.otpRetryLimit;
    emit({'state': CountdownState.running, 'timeLeft': _timeLeft});

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        _timeLeft--;
        emit({'state': CountdownState.running, 'timeLeft': _timeLeft});
      } else {
        _timer?.cancel();
        emit({'state': CountdownState.stopped, 'timeLeft': 0});
      }
    });
  }

  void stopCountdown() {
    _timer?.cancel();
    emit({'state': CountdownState.idle, 'timeLeft': AppConstant.otpRetryLimit});
  }
}
