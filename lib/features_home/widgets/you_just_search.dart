import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class YouJustSearched extends StatelessWidget {
  const YouJustSearched({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 130.w,
            height: 80.h,
            margin: EdgeInsets.fromLTRB(20.w, 0, 0, 20.h),
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(249, 250, 251, 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 0.1,
                  blurRadius: 0.7,
                  offset: const Offset(0.5, 0.5),
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'BD',
                      style: GoogleFonts.openSans(
                          fontSize: 12.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                        width: 30.w,
                        child: const Icon(Icons.arrow_forward_outlined)),
                    Text(
                      'JKTA',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          fontSize: 12.sp, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Center(
                  child: Text(
                    'Rabu, 05 Apr - Kamis, 06 Apr',
                    style: GoogleFonts.openSans(
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
