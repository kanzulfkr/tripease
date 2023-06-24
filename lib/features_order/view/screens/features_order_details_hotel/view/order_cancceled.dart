import 'package:hotel_1/main_page.dart';

import '/features_order/view_model/provider/hotel/hotel_order_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/fonts.dart';
import '../../../../utils/icons.dart';
import '../../../../utils/images.dart';

class OrderCanccel extends StatelessWidget {
  const OrderCanccel({super.key});

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const MainPage(),
            ));
          },
        ),
      ),
      body: Consumer<HotelOrderDetailProvider>(
        builder: (context, orderDetail, _) {
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                                  borderRadius: BorderRadius.circular(
                                      4.r), // Image border
                                  child: SizedBox.fromSize(
                                    size: Size.fromRadius(48.r), // Image radius
                                    child: everyday,
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        orderDetail.getNameHotel ?? '',
                                        style: myTextTheme.displayMedium,
                                      ),
                                      SizedBox(height: 10.h),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              iconLocation,
                                              SizedBox(width: 4.w),
                                              Expanded(
                                                child: Text(
                                                  orderDetail.getAddressHotel ??
                                                      '',
                                                  style:
                                                      myTextTheme.headlineSmall,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              iconBed,
                                              SizedBox(width: 5.w),
                                              Text(
                                                orderDetail.getNameRoomHotel ??
                                                    '',
                                                style:
                                                    myTextTheme.headlineSmall,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              iconBedTime,
                                              SizedBox(width: 5.w),
                                              Text(
                                                '${orderDetail.getNumberOfNight ?? ''}Night',
                                                style:
                                                    myTextTheme.headlineSmall,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              iconDate,
                                              SizedBox(width: 5.w),
                                              Expanded(
                                                child: Text(
                                                  '${orderDetail.getCheckIn ?? ''} - ${orderDetail.getCheckOut ?? ''}',
                                                  style:
                                                      myTextTheme.headlineSmall,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
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
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${orderDetail.getTypePayment} ${orderDetail.getNameBank}',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
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
                    SizedBox(height: 10.h),
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
