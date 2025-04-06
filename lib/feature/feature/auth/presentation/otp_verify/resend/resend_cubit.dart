import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

enum CountdownState {
  idle, // Timer is not running
  running, // Timer is running
  stopped, // Timer is stopped (completed)
}

class CountdownCubit extends Cubit<Map<String, dynamic>> {
  Timer? _timer;
  int _timeLeft = 60; // Default countdown time (in seconds)

  CountdownCubit() : super({'state': CountdownState.idle, 'timeLeft': 60});

  // Function to start the countdown
  void startCountdown() {
    _timeLeft = 60; // Reset the countdown to 60 seconds
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

  // Function to stop the countdown (for when the user presses Resend)
  void stopCountdown() {
    _timer?.cancel();
    emit({'state': CountdownState.idle, 'timeLeft': 60});
  }
}
