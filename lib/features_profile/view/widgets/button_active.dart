import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonActive extends StatelessWidget {
  const ButtonActive({
    super.key,
    required this.text,
    // required this.colorText,
    // required this.colorButton,
    required this.onTap,
  });

  final String text;
  // final Color colorText;
  // final Color colorButton;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 128, 255, 1),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: InkWell(
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.openSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        onTap: () => onTap(),
      ),
    );
  }
}
