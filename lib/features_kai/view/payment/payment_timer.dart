import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../view_model/time_payment_provider.dart';

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
            child: Obx(
              () => Text(
                widget.timerText.timer.value,
                style: GoogleFonts.openSans(
                    fontSize: 12.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
