import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../view_model/timer/time_payment_provider.dart';

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
    timerSeat.stopCountDown();
    timerSeat.startCountDown(context);
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
      if (timerSeat.isTimeUp()) {
        countdownTimer?.cancel();

        Navigator.of(context).pop();
        showDialogWithContext(context);
      }
    });
  }

  Future<dynamic> showDialogWithContext(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return const AlertDialog(
          title: Text('Time Up'),
          content: Text('The time has run out.'),
        );
      },
    );
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Waktu Pembayaran',
          style: GoogleFonts.openSans(
              fontSize: 12.sp, fontWeight: FontWeight.w600),
        ),
        Consumer<TimerPaymentProvider>(
          builder: (context, timerSeat, _) {
            return Text(timerSeat.timer,
                style: GoogleFonts.openSans(
                    fontSize: 14.sp, fontWeight: FontWeight.w600));
          },
        ),
      ],
    );
  }
}
