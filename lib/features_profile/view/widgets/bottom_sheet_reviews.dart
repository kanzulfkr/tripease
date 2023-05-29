import 'package:capstone_project_tripease/features_profile/view/widgets/button_active.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

Future<dynamic> bottomSheetReviews(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (builder) {
      return Container(
        height: 405.h,
        width: double.maxFinite,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(
              color: const Color.fromRGBO(150, 152, 156, 1),
              height: 30.h,
              thickness: 6,
              endIndent: 170,
              indent: 170,
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h, bottom: 10.h),
              child: Text(
                'Terima kasih atas masukan Anda!',
                style: GoogleFonts.openSans(
                    fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ),
            Divider(
              color: Colors.black,
              height: 10.h,
              thickness: 0.3,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32.h),
              child: SvgPicture.asset('assets/icons/emoji_pray.svg'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Text(
                'Masukan dan saran yang Anda berikan akan membantu pengembangan layanan kami.',
                style: GoogleFonts.openSans(
                    fontSize: 14.sp, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: ButtonActive(
                text: 'Tutup',
                onTap: () => Navigator.of(context).pop(),
              ),
            )
          ],
        ),
      );
    },
  );
}
