import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NotFoundSchedule extends StatelessWidget {
  const NotFoundSchedule({
    super.key,
    required this.value1,
    required this.value2,
  });
  final String value1;
  final String value2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.h, bottom: 30.h),
            child: Image.asset(
              'assets/images/not-found.png',
              height: 150.h,
              width: 150.w,
            ),
          ),
          Text(
            "Tidak ditemukan jadwal kereta dari stasiun $value1 ke stasiun $value2 !",
            style: GoogleFonts.openSans(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xDBDB2D24)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
