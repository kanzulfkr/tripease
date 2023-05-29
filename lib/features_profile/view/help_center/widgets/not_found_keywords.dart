import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NotFoundKeywords extends StatelessWidget {
  const NotFoundKeywords({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/emoji_pray.svg',
              height: 120.h,
              width: 120.w,
            ),
            SizedBox(height: 15.h),
            Text(
              'Maaf sayang, kata kunci pencarian anda tidak dapat kami temukan',
              style: GoogleFonts.openSans(
                  fontSize: 14.sp, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 200.h),
          ],
        ));
  }
}
