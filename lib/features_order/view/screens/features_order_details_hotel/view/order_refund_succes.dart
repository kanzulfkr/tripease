import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/fonts.dart';
import '../../../../utils/icons.dart';
import '../../../../utils/images.dart';


class OrderRefundSucces extends StatelessWidget {
  const OrderRefundSucces({super.key});

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
                    top: 20.0.h,
                  ),
                  child: Container(
                    width: 350.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: success,
                      borderRadius: BorderRadius.circular(8.0.r),
                      border: Border.all(color: green),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0.w),
                      child: Row(
                        children: [
                          iconSuccess,
                          SizedBox(width: 10.w),
                          Text(
                            'Pesananmu Berhasil DiKembalikan',
                            style: GoogleFonts.openSans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: green,
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
                height: 180.h,
                child: Padding(
                  padding: EdgeInsets.all(20.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Detail Pesanan',
                        style: GoogleFonts.openSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: mainBlue,
                        ),
                      ),
                      SizedBox(height: 19.h),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(4.r), // Image border
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(48.r), // Image radius
                              child: shibuya,
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shibuya Shabu',
                                  style: myTextTheme.displayMedium,
                                ),
                                SizedBox(height: 10.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        iconLocation,
                                        SizedBox(width: 4.w),
                                        Text(
                                          'Bangkok, Thailand',
                                          style: myTextTheme.headlineSmall,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        iconBed,
                                        SizedBox(width: 5.w),
                                        Text(
                                          'Exclusive Room',
                                          style: myTextTheme.headlineSmall,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        iconBedTime,
                                        SizedBox(width: 5.w),
                                        Text(
                                          '1 Night',
                                          style: myTextTheme.headlineSmall,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        iconDate,
                                        SizedBox(width: 4.w),
                                        Text(
                                          '26 April 2023 - 27 April 2023',
                                          style: myTextTheme.headlineSmall,
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
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
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 30.w,
                            child: Image.asset('assets/images/BRI.jpeg'),
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
                        'Informasi Pengembalian Dana',
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
                            'Dikembalikan ke',
                            style: GoogleFonts.openSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Bank BRI',
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
                            'Jumlah Pengembalian',
                            style: GoogleFonts.openSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Rp. 400.000',
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
                            'Dikembalikan Pada',
                            style: GoogleFonts.openSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '23-04-2023, 18:54',
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
                            'Alasan Pembatalan',
                            style: GoogleFonts.openSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Double Booking',
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
                  'Kembali Ke Beranda',
                  style: myTextTheme.headlineMedium,
                ),
                onPressed: () {},
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
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
