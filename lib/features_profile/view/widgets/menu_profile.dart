import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuProfile extends StatelessWidget {
  const MenuProfile({
    super.key,
    required this.iconName,
    required this.name,
    required this.description,
    required this.onTap,
  });
  final IconData iconName;
  final String name;
  final String description;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 72.h,
        padding: EdgeInsets.fromLTRB(15.h, 20.h, 15.h, 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: const Color.fromRGBO(240, 240, 248, 1),
              child: Icon(
                iconName,
                color: const Color.fromRGBO(0, 128, 255, 1),
              ),
            ),
            SizedBox(width: 12.h),
            Container(
              width: 180.h,
              margin: EdgeInsets.only(right: 48.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: GoogleFonts.openSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(150, 152, 156, 1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 24.h,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16.sp,
                color: const Color.fromRGBO(150, 152, 156, 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
