import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../features_pesanan/utils/colors.dart';
import '../../features_pesanan/utils/fonts.dart';
import '../../features_pesanan/utils/icons.dart';
import '../../features_pesanan/utils/images.dart';

class PesananBatal extends StatelessWidget {
  const PesananBatal({super.key});

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
                      color: canceled,
                      borderRadius: BorderRadius.circular(8.0.r),
                      border: Border.all(color: red),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0.w),
                      child: Row(
                        children: [
                          iconCanceled,
                          SizedBox(width: 10.w),
                          Text(
                            'Pesanan Dibatalkan',
                            style: GoogleFonts.openSans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: red,
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
                              child: everyday,
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Everyday',
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
                                          'Jl. Soekarno Hatta, Malang',
                                          style: myTextTheme.headlineSmall,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        iconBed,
                                        SizedBox(width: 5.w),
                                        Text(
                                          'Standard Room',
                                          style: myTextTheme.headlineSmall,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        iconBedTime,
                                        SizedBox(width: 5.w),
                                        Text(
                                          '2 Night',
                                          style: myTextTheme.headlineSmall,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        iconDate,
                                        SizedBox(width: 5.w),
                                        Text(
                                          '05 Mei 2023 - 07 Mei 2023',
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
                height: 160.h,
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
                      const Divider(color: black),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Alasan Pembatalan',
                            style: GoogleFonts.openSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Tidak Ada Pembayaran',
                            style: GoogleFonts.openSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
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
                  'Booking Lagi',
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
            ],
          ),
        ),
      ),
    );
  }
}
