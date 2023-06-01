import 'package:capstone_project_tripease/kai/view_model/time_payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentTimer extends StatefulWidget {
  const PaymentTimer({
    super.key,
    required this.timerText,
  });

  final TimerPayment timerText;

  @override
  State<PaymentTimer> createState() => _PaymentTimerState();
}

class _PaymentTimerState extends State<PaymentTimer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 20, bottom: 9),
          child: Text(
            'Waktu Pembayaran',
            style:
                GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 12, left: 220),
          child: Obx(
            () => Text(
              widget.timerText.timer.value,
              style: GoogleFonts.openSans(
                  fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
