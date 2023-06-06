import 'package:capstone_project_tripease/kai/view/payment/payment_va.dart';
import 'package:capstone_project_tripease/kai/view/payment/payment_timer.dart';
import 'package:capstone_project_tripease/kai/view/payment/select_payment.dart';
import 'package:capstone_project_tripease/kai/view_model/time_payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TimerPaymentProvider timerText = Get.put(TimerPaymentProvider());
  int selectedRadio = 0;
  bool isChecked = false;
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
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentTimer(timerText: timerText),
            SizedBox(
              height: 82.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 70.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          height: 20.h,
                        ),
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 150.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          child: Text(
                            'Tiket',
                            style: GoogleFonts.openSans(
                                fontSize: 14.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          'Asuransi',
                          style: GoogleFonts.openSans(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          child: Text(
                            '8 x Rp. 15.000',
                            style: GoogleFonts.openSans(
                                fontSize: 14.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          '8 x Rp. 3.000',
                          style: GoogleFonts.openSans(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 5.h,
              thickness: 1.4,
              color: Colors.black,
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: GoogleFonts.openSans(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Rp. 144.000',
                  style: GoogleFonts.openSans(
                      fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Divider(
              height: 5.h,
              thickness: 1.4,
              color: Colors.black,
            ),
            SizedBox(height: 15.h),
            Row(
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
            SizedBox(height: 15.h),
            const SelectPayment(),
            SizedBox(height: 15.h),
            const ButtonPayment(),
          ],
        ),
      ),
    );
  }
}

class ButtonPayment extends StatelessWidget {
  const ButtonPayment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PaymentVA(timerText: TimerPaymentProvider()),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(252, 40), // Ukuran tombol
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  5), // Sudut melengkung dengan jari-jari 5
            ),
            padding: const EdgeInsets.fromLTRB(
                24, 0, 24, 0), // Padding di kiri dan kanan
            primary: const Color(0XFF0080FF) // Warna latar belakang biru
            ),
        child: Text(
          'Lanjut',
          style: GoogleFonts.openSans(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white, // Warna teks putih
          ),
        ),
      ),
    );
  }
}
