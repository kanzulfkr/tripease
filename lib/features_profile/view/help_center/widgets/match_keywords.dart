import '/features_profile/view/help_center/detail_topic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchKeywords extends StatelessWidget {
  const MatchKeywords({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const DetailTopic(
                  title: 'Details Topic',
                ),
              ));
            },
            child: Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      'Ketentuan Refund dan Reschedule Kereta Api selama periode',
                      style: GoogleFonts.openSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(0, 128, 255, 1),
                        letterSpacing: 0.25,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 7.h, bottom: 10.h),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      'Kereta + Hotel / info Paket Kereta + Hotel / Pemesanan Kereta + Hotel',
                      style: GoogleFonts.openSans(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.4,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Divider(
                    color: Colors.black54,
                    height: 3.h,
                    thickness: 1,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
