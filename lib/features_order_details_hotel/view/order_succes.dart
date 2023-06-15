import 'package:capstone_project_tripease/features_order_details_hotel/features_checkin_checkout/reviews.dart';
import 'package:capstone_project_tripease/features_order/view/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../features_order/utils/colors.dart';
import '../../features_order/utils/fonts.dart';
import '../../features_order/utils/icons.dart';

class OrderSucces extends StatelessWidget {
  const OrderSucces({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rincian Pesanan',
          style: myTextTheme.headlineLarge,
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20.h,
                  ),
                  child: Container(
                    width: 350.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: finish,
                      borderRadius: BorderRadius.circular(8.0.r),
                      border: Border.all(color: orange),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0.w),
                      child: Row(
                        children: [
                          iconFinish,
                          SizedBox(width: 10.w),
                          Text(
                            'Pesanan Selesai',
                            style: GoogleFonts.openSans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                decoration: BoxDecoration(
                  color: background,
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.5),
                      spreadRadius: 1.w,
                      blurRadius: 3.w,
                      offset: const Offset(1, 1),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8.r),
                ),
                width: 350.w,
                height: 100.h,
                child: Padding(
                  padding: EdgeInsets.all(20.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Metode Pembayaran',
                        style: GoogleFonts.openSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: mainBlue,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Virtual Account BRI',
                            style: GoogleFonts.openSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 30.w,
                            child: Image.asset('assets/images/bri.png'),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                decoration: BoxDecoration(
                  color: background,
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.5),
                      spreadRadius: 1.w,
                      blurRadius: 3.w,
                      offset: const Offset(1, 1),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8.r),
                ),
                width: 350.w,
                height: 145.h,
                child: Padding(
                  padding: EdgeInsets.all(20.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informasi Pesanan',
                        style: GoogleFonts.openSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: mainBlue,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Waktu Pemesanan',
                            style: GoogleFonts.openSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '19-04-2023, 05:34',
                            style: GoogleFonts.openSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Waktu Pembayaran',
                            style: GoogleFonts.openSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '24-04-2023, 21:36',
                            style: GoogleFonts.openSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Waktu Check-in',
                            style: GoogleFonts.openSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '26-04-2023, 14:00',
                            style: GoogleFonts.openSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Waktu Check-out',
                            style: GoogleFonts.openSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '27-04-2023, 11:45',
                            style: GoogleFonts.openSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                    Size(350.w, 50.h),
                  ),
                ),
                child: Text(
                  'Beri Penilaian',
                  style: myTextTheme.headlineMedium,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  const Reviews(title: 'Everyday'),
                  ));
                },
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(
                    buttons,
                  ),
                  fixedSize: MaterialStatePropertyAll(
                    Size(350.w, 50.h),
                  ),
                ),
                child: Text(
                  'Hubungi Bantuan',
                  style: GoogleFonts.openSans(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: mainBlue,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
