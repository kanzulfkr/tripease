import 'package:capstone_project_tripease/features_profile/view/help_center/detail_topic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularKeywords extends StatefulWidget {
  const PopularKeywords({
    super.key,
  });

  @override
  State<PopularKeywords> createState() => _PopularKeywordsState();
}

class _PopularKeywordsState extends State<PopularKeywords> {
  List popularKeyWords = [
    'konfirmasi pesanan',
    'kirim ulang e-tiket',
    'Pembatalan tiket kereta',
    'koreksi nama penumpang',
    'status pembayaran',
    'cara pesan',
    'konfirmasi pembayaran',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650.h,
      color: const Color.fromRGBO(240, 240, 248, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Text(
              'Kata Kunci Populer',
              style: GoogleFonts.openSans(
                  fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            color: Colors.white,
            // height: 250.h,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Center(
              child: Wrap(
                children: popularKeyWords.map(
                  (keyWords) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DetailTopic(
                            title: 'Details Topic',
                          ),
                        ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.w),
                        margin: EdgeInsets.only(top: 7.h, bottom: 7, right: 10),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(240, 240, 248, 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 40.h,
                        child: Text(
                          keyWords,
                          style: GoogleFonts.openSans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(0, 128, 255, 1),
                            letterSpacing: 0.0125,
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
