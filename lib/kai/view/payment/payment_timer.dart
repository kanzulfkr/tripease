import 'dart:async';

import 'package:capstone_project_tripease/kai/view_model/time_payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentTimer extends StatefulWidget {
  const PaymentTimer({
    super.key,
    required this.timerText,
  });

  final TimerPaymentProvider timerText;

  @override
  State<PaymentTimer> createState() => _PaymentTimerState();
}

class _PaymentTimerState extends State<PaymentTimer> {
  TimerPaymentProvider timerText = TimerPaymentProvider();
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    TimerPaymentProvider timerSeat =
        Provider.of<TimerPaymentProvider>(context, listen: false);
    timerSeat.startCountDown(context);
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
      if (timerSeat.isTimeUp()) {
        countdownTimer?.cancel();
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h, left: 20.w, bottom: 9.h, right: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Waktu Pembayaran',
            style: GoogleFonts.openSans(
                fontSize: 12.sp, fontWeight: FontWeight.w600),
          ),
          Container(
            child: Consumer<TimerPaymentProvider>(
              builder: (context, timerSeat, _) {
                return Text(
                  timerSeat.timer,
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
