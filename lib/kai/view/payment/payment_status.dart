import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentStatus extends StatelessWidget {
  const PaymentStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Status Pembayaran',
          style: GoogleFonts.openSans(
              fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/paymentstatus.png'),
          SizedBox(
            height: 135.h,
          ),
          Text(
            'Pembayaran Berhasil!',
            style: GoogleFonts.openSans(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.green),
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Container(
              width: 100.w,
              child: Row(
                children: [
                  const Icon(Icons.train),
                  SizedBox(
                    width: 24.w,
                  ),
                  Text(
                    'Turangga',
                    style: GoogleFonts.openSans(
                        fontSize: 14.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Container(
              width: 100.w,
              child: Row(
                children: [
                  const Icon(Icons.person),
                  SizedBox(
                    width: 24.w,
                  ),
                  Text(
                    '4 Orang',
                    style: GoogleFonts.openSans(
                        fontSize: 14.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Container(
              width: 100.w,
              child: Row(
                children: [
                  const Icon(Icons.payments),
                  SizedBox(
                    width: 24.w,
                  ),
                  Text(
                    'Rp. ',
                    style: GoogleFonts.openSans(
                        fontSize: 14.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
