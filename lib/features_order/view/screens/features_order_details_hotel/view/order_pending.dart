import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/fonts.dart';
import '../../../../utils/icons.dart';
import '../../../../utils/images.dart';
import '../../../../view_model/provider/coundown_provider.dart';
import '../../../../view_model/provider/hotel/hotel_order_detail_provider.dart';
import '../../../../view_model/provider/hotel/hotel_order_update_provider.dart';

class OrderPending extends StatefulWidget {
  const OrderPending({super.key});

  @override
  State<OrderPending> createState() => _OrderPendingState();
}

class _OrderPendingState extends State<OrderPending> {
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
                            color: wait,
                            borderRadius: BorderRadius.circular(8.0.r),
                            border: Border.all(
                              color: kuning,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0.w),
                            child: Row(
                              children: [
                                iconWait,
                                SizedBox(width: 10.w),
                                Text(
                                  'Menunggu Pembayaran',
                                  style: GoogleFonts.openSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: kuning,
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
                                                '${orderDetail.getNumberOfNight ?? ''} Night',
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
                              'Selesaikan Pembayaran',
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
                                Expanded(
                                  child: Text(
                                    orderDetail.getCheckIn ?? '',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Consumer<CountdownProvider>(
                                  builder: (context, timerProvider, _) {
                                    return Expanded(
                                      child: CountdownTimer(
                                        endTime: timerProvider.endTime,
                                        textStyle: GoogleFonts.openSans(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        onEnd: () {
                                          var orderProvider = Provider.of<
                                                  StatusOrderHotelUpdateProvider>(
                                              context,
                                              listen: false);

                                          int? hotelOrderId =
                                              orderDetail.getHotelOrderId;
                                          String status = 'canceled';
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                  'Waktu Habis',
                                                  style: GoogleFonts.openSans(
                                                    color: black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                content: Text(
                                                  'Pesanan Dibatalkan',
                                                  style: GoogleFonts.openSans(
                                                    color: black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    child: Text(
                                                      'Tutup',
                                                      style:
                                                          GoogleFonts.openSans(
                                                        color: mainBlue,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          ).then((value) {
                                            orderProvider.updateOrderStatus(
                                                hotelOrderId!, status);
                                          });
                                        },
                                      ),
                                    );
                                  },
                                ),
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
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Nomor Rekening',
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  orderDetail.getAccountNumber ?? '',
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Nama Penerima',
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  orderDetail.getAccountName ?? '',
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
                      height: 165.h,
                      child: Padding(
                        padding: EdgeInsets.all(20.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Informasi Pembayaran',
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
                                  "(x${orderDetail.getQuantityAdult}) ${orderDetail.getNameRoomHotel} (${orderDetail.getNumberOfNight} malam)",
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  orderDetail.getPriceHotel ?? '',
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Promo",
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  orderDetail.getDiscountPrice ?? '',
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              color: black,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Jumlah Transfer : ",
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  orderDetail.getTotalAmount ?? '',
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
                        'Mulai Pembayaran',
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
                    SizedBox(height: 16.h),
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
