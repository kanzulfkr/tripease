import 'package:capstone_project_tripease/kai/view_model/time_payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
        Obx(
          () => Text(
            widget.timerText.timer.value,
            style: GoogleFonts.openSans(
                fontSize: 12.sp, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
