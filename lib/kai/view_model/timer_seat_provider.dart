import 'dart:async';
import 'package:flutter/material.dart';

class TimerSeatProvider extends ChangeNotifier {
  String timer = '03:00';
  Timer? countdownTimer;
  bool isTimeUp() {
    int totalSeconds = _calculateTotalSeconds(timer);
    return totalSeconds <= 0;
  }

  int _calculateTotalSeconds(String timer) {
    List<String> timeParts = timer.split(':');
    int minutes = int.parse(timeParts[0]);
    int seconds = int.parse(timeParts[1]);
    return (minutes * 60) + seconds;
  }

  void startCountDown(BuildContext context) {
    const oneSec = Duration(seconds: 1);
    int totalSeconds = 180; // Total duration in seconds (3 minutes)

    countdownTimer = Timer.periodic(oneSec, (timer) {
      if (totalSeconds <= 0) {
        timer.cancel();
        showTimeUpDialog(context); // Show the alert dialog when time is up
      } else {
        totalSeconds--;
        updateTimer(totalSeconds);
      }
    });
  }

  void updateTimer(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    timer =
        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    notifyListeners(); // Notify listeners about the updated timer value
  }

  void showTimeUpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return const AlertDialog(
          title: Text('Time Up'),
          content: Text('The time has run out.'),
        );
      },
    );
  }

  void stopCountDown() {
    countdownTimer?.cancel();
  }

  @override
  void dispose() {
    stopCountDown();
    super.dispose();
  }
}
