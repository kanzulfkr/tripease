import 'dart:async';

import 'package:capstone_project_tripease/kai/view/payment/payment_timer.dart';
import 'package:capstone_project_tripease/kai/view/payment/select_payment.dart';
import 'package:capstone_project_tripease/kai/view_model/time_payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  final SelectPayment selectPayment;
  const PaymentPage({super.key, required this.selectPayment});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TimerPaymentProvider timerText = TimerPaymentProvider();
  Timer? countdownTimer;
  int selectedRadio = 0;
  bool isChecked = false;

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pembayaran',
          style: GoogleFonts.openSans(
              fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: 800.h,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentTimer(timerText: timerText),
            Padding(
              padding: EdgeInsets.only(left: 60.w, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tiket',
                    style: GoogleFonts.openSans(
                        fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '8 x Rp. 5.000',
                    style: GoogleFonts.openSans(
                        fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18.w, right: 20.w),
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Text(
                    'Asuransi',
                    style: GoogleFonts.openSans(
                        fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 150.w),
                    child: Text(
                      '8 x Rp. 8.000',
                      style: GoogleFonts.openSans(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: 400.w,
                height: 1.h,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.only(left: 60.w, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: GoogleFonts.openSans(
                        fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Rp. 144.000',
                    style: GoogleFonts.openSans(
                        fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: 400.w,
                height: 1.h,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.only(left: 60.w, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: GoogleFonts.openSans(
                        fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Rp. 144.000',
                    style: GoogleFonts.openSans(
                        fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SelectPayment(),
            // SizedBox(height: 20.h),
            // const ButtonPayment(),
          ],
        ),
      ),
    );
  }
}

// class ButtonPayment extends StatefulWidget {
//   const ButtonPayment({
//     super.key,
//   });

//   @override
//   State<ButtonPayment> createState() => _ButtonPaymentState();
// }

// class _ButtonPaymentState extends State<ButtonPayment> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(
//             fixedSize: const Size(252, 40), // Ukuran tombol
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(
//                   5), // Sudut melengkung dengan jari-jari 5
//             ),
//             padding: const EdgeInsets.fromLTRB(
//                 24, 0, 24, 0), // Padding di kiri dan kanan
//             primary: const Color(0XFF0080FF) // Warna latar belakang biru
//             ),
//         child: Text(
//           'Lanjut',
//           style: GoogleFonts.openSans(
//             fontSize: 14.sp,
//             fontWeight: FontWeight.w600,
//             color: Colors.white, // Warna teks putih
//           ),
//         ),
//       ),
//     );
//   }
// }
