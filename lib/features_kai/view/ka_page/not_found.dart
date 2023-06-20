import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NotFoundStation extends StatelessWidget {
  const NotFoundStation({
    super.key,
    required this.value,
  });
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.h, bottom: 12.h),
          child: Image.asset(
            'assets/images/not-found.png',
            height: 196,
            width: 181.5,
          ),
        ),
        Text(
          "Tidak ditemukan hasil untuk '$value' !\n\n Mohon untuk mencoba kata kunci berbeda.",
          style: GoogleFonts.openSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xDBDB2D24)),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
