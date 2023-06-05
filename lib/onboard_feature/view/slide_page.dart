import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SlidePage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const SlidePage(
      {super.key,
        required this.title,
        required this.description,
        required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 20.sp, right: 20.sp, top: 30.sp, bottom: 130.sp),
      color: Colors.white,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          image,
          height: 218.h,
          width: 320.w,
        ),
        SizedBox(
          height: 60.h,
        ),
        Text(
          title,
          style: GoogleFonts.openSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xEE262627)),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          description,
          style: GoogleFonts.openSans(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xEE262627)),
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
