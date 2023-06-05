import 'package:capstone_project_tripease/features_profile/view/widgets/bottom_sheet_reviews.dart';
import 'package:capstone_project_tripease/features_profile/view_model/article_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailTopic extends StatefulWidget {
  const DetailTopic({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<DetailTopic> createState() => _DetailTopicState();
}

class _DetailTopicState extends State<DetailTopic> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleProvider>(
      builder: (context, value, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(240, 240, 248, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(0, 128, 255, 1),
          title: Text(
            'Pencarian',
            style: GoogleFonts.openSans(
                fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          // bottom: PreferredSize(
          //   preferredSize: Size(double.maxFinite, 84.h),
          //   child: Container(
          //     padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 20.h),
          //     width: double.infinity,
          //     child: Center(
          //       child: TextFormField(
          //         decoration: InputDecoration(
          //           filled: true,
          //           fillColor: Colors.white,
          //           contentPadding:
          //               EdgeInsets.only(right: 16.w, top: 10.h, bottom: 10.h),
          //           hintText: 'Ketuk untuk cari',
          //           hintStyle: GoogleFonts.openSans(
          //             fontSize: 14.sp,
          //             color: const Color.fromRGBO(150, 152, 156, 1),
          //           ),
          //           prefix: const SizedBox(width: 12),
          //           prefixIcon: const Icon(
          //             Icons.search,
          //             color: Color.fromRGBO(150, 152, 156, 1),
          //           ),
          //           focusedBorder: OutlineInputBorder(
          //             borderSide: const BorderSide(
          //                 width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
          //             borderRadius: BorderRadius.circular(8.r),
          //           ),
          //           enabledBorder: OutlineInputBorder(
          //             borderSide: const BorderSide(
          //                 width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
          //             borderRadius: BorderRadius.circular(8.r),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
              child: Text(
                value.loading ? 'Judul' : value.articleById!.title!,
                style: GoogleFonts.openSans(
                    fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ),
            value.loading
                ? Container(
                    width: double.maxFinite,
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(20.w, 20.h, 35.w, 20.h),
                    child: Text(
                      '',
                      style: GoogleFonts.openSans(fontSize: 12.sp),
                    ),
                  )
                : Container(
                    width: double.maxFinite,
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(20.w, 20.h, 35.w, 20.h),
                    child: Text(
                      value.articleById!.description!,
                      style: GoogleFonts.openSans(fontSize: 12.sp),
                    ),
                  ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 12.h),
              child: Text(
                'Apakah Artikel ini membantu?',
                style: GoogleFonts.openSans(
                    fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      bottomSheetReviews(context);
                    },
                    child: Container(
                      width: 77.w,
                      height: 40.h,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset('assets/icons/smile.svg'),
                          Text(
                            'Ya',
                            style: GoogleFonts.openSans(
                                fontSize: 14.sp, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  InkWell(
                    onTap: () {
                      bottomSheetReviews(context);
                    },
                    child: Container(
                      width: 77.w,
                      height: 40.h,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset('assets/icons/sad.svg'),
                          Text(
                            'Tidak',
                            style: GoogleFonts.openSans(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(0, 128, 255, 1)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
