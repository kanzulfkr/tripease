import 'package:capstone_project_tripease/features_order/view/widgets/home.dart';
import 'package:capstone_project_tripease/features_order/view_model/provider/hotel/hotel_order_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/fonts.dart';
import '../../../../utils/icons.dart';
import '../features_checkin_checkout/reviews.dart';

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
      body: Consumer<HotelOrderDetailProvider>(
        builder: (context, orderDetail, _) {
          return ListView(
            children: [
              Padding(
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
                                  orderDetail.getTypePayment ?? '',
                                  style: GoogleFonts.openSans(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: 30.w,
                                  child: Image.network(
                                      orderDetail.getImagePayment ?? ''),
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
                                  orderDetail.getCreateAt ?? '',
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
                                  orderDetail.getUpdateAt ?? '',
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
                                  orderDetail.getCheckIn ?? '',
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
                                  orderDetail.getCheckOut ?? '',
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
                          builder: (context) =>
                              const Reviews(title: 'Everyday'),
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
            ],
          );
        },
      ),
    );
  }
}
