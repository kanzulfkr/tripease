import '/features_profile/view/widgets/button_active.dart';
import '/features_profile/view/widgets/button_inactive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
    required this.title,
    required this.content,
    required this.btnActive,
    required this.btnInactive,
    required this.onTapActive,
  });
  final String title;
  final String content;
  final String btnActive;
  final String btnInactive;
  final VoidCallback onTapActive;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      titleTextStyle: GoogleFonts.openSans(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              content,
              style: GoogleFonts.openSans(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.h),
            ButtonActive(
              text: btnActive,
              onTap: () {
                onTapActive();
              },
            ),
            SizedBox(height: 12.h),
            ButtonInactive(
              text: btnInactive,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      actions: null,
    );
  }
}
