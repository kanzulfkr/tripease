import 'package:capstone_project_tripease/features_profile/view/help_center/detail_topic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularTopic extends StatelessWidget {
  const PopularTopic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 567.h,
      width: double.maxFinite,
      padding: EdgeInsets.all(16.w),
      color: const Color.fromRGBO(240, 240, 248, 1),
      child: Container(
        color: Colors.white,
        padding:
            EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(bottom: 26.h),
              child: Text(
                'Topik Populer',
                style: GoogleFonts.openSans(
                    fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 430.h,
              width: double.maxFinite,
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DetailTopic(
                          title: 'Details Topic',
                        ),
                      ));
                    },
                    child: SizedBox(
                      height: 60.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 265.w,
                                child: Text(
                                  'Ketentuan Refund dan Reschedule Kereta Api selama periode',
                                  style: GoogleFonts.openSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              const Icon(
                                Icons.keyboard_arrow_right,
                                color: Color.fromRGBO(0, 128, 255, 1),
                              )
                            ],
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
            ),
          ],
        ),
      ),
    );
  }
}
