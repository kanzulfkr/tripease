import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerPayment extends GetxController {
  RxString timer = '03:00'.obs;
  Timer? countdownTimer;

  @override
  void onInit() {
    super.onInit();
    startCountDown();
  }

  void startCountDown() {
    const oneSec = Duration(seconds: 1);
    int totalSeconds = 300; // Total duration in seconds (3 minutes)

    countdownTimer = Timer.periodic(oneSec, (timer) {
      if (totalSeconds <= 0) {
        timer.cancel();
        showTimeUpDialog(); // Show the alert dialog when time is up
      } else {
        totalSeconds--;
        updateTimer(totalSeconds);
      }
    });
  }

  void updateTimer(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    timer.value =
        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void showTimeUpDialog() {
    Get.dialog(
      const AlertDialog(
        title: Text('Time Up'),
        content: Text('The time has run out.'),
      ),
    );
  }

  @override
  void onClose() {
    countdownTimer?.cancel();
    super.onClose();
  }
}
