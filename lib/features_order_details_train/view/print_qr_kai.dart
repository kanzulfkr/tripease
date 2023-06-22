import 'package:capstone_project_tripease/features_order/model/train/train_order_model.dart';
import 'package:capstone_project_tripease/features_order/view_model/provider/train/train_order_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PrintQrKai extends StatelessWidget {
  const PrintQrKai({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.h),
        child: AppBar(
          toolbarHeight: 48.h,
          title: Text(
            'Rincian Pesanan',
            style: GoogleFonts.openSans(
                fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Consumer<TrainOrderDetailProvider>(
        builder: (context, orderDetail, _) {
          return Padding(
            padding: EdgeInsets.all(16.sp),
            child: ListView(
              children: [
                SizedBox(
                    width: 328.w,
                    child: Card(
                        shadowColor: Colors.black.withOpacity(1),
                        elevation: 4.sp,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 12.sp,
                              right: 12.sp,
                              top: 12.sp,
                              bottom: 12.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Informasi Pesanan',
                                  style: GoogleFonts.openSans(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF0080FF))),
                              SizedBox(
                                height: 8.h,
                              ),
                              SizedBox(
                                height: 21.h,
                                width: 50.84.w,
                                child: Image.asset(
                                  'assets/images/KAI.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                orderDetail.getNameTrain ?? '',
                                style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                orderDetail.getClassTrain ?? '',
                                style: GoogleFonts.openSans(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Nomor Pesanan: ',
                                      style: GoogleFonts.openSans(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400)),
                                  Expanded(
                                    child: Text(
                                      orderDetail.getTicketOrderCode ?? '',
                                      style: GoogleFonts.openSans(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                    width: 328.w,
                    child: Card(
                        shadowColor: Colors.black.withOpacity(1),
                        elevation: 4.sp,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 16.sp,
                              top: 16.sp,
                              right: 16.sp,
                              bottom: 16.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Detail Pesanan',
                                  style: GoogleFonts.openSans(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF0080FF))),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    orderDetail.getStationOrigin ?? '',
                                    style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(orderDetail.getStationDestination ?? '',
                                      style: GoogleFonts.openSans(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    orderDetail.getDepatureTime ?? '',
                                    style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Icon(Icons.arrow_forward, size: 12.sp),
                                  Text(orderDetail.getArriveTime ?? '',
                                      style: GoogleFonts.openSans(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Text('29 April 2023',
                                  //     style: GoogleFonts.openSans(
                                  //         fontSize: 12.sp,
                                  //         fontWeight: FontWeight.w600)),
                                  Text(orderDetail.getDateTime ?? '',
                                      style: GoogleFonts.openSans(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600)),
                                  // Text('29 April 2023',
                                  //     style: GoogleFonts.openSans(
                                  //         fontSize: 12.sp,
                                  //         fontWeight: FontWeight.w600))
                                ],
                              )
                            ],
                          ),
                        ))),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                    width: 328.w,
                    child: Card(
                        shadowColor: Colors.black.withOpacity(1),
                        elevation: 4.sp,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 16.sp,
                              top: 16.sp,
                              right: 16.sp,
                              bottom: 16.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Informasi Penumpang',
                                  style: GoogleFonts.openSans(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF0080FF))),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Penumpang',
                                    style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text('No. ID',
                                      style: GoogleFonts.openSans(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    orderDetail.getNameOrder ?? '',
                                    style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(orderDetail.getAccountNumber ?? '',
                                      style: GoogleFonts.openSans(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tipe Penumpang',
                                    style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text('No. Kursi',
                                      style: GoogleFonts.openSans(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(orderDetail.getClassTrain ?? '',
                                      style: GoogleFonts.openSans(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                      '${orderDetail.getTrainCarriage} / ${orderDetail.getTrainSeat}',
                                      style: GoogleFonts.openSans(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400))
                                ],
                              )
                            ],
                          ),
                        ))),
                SizedBox(
                  height: 24.h,
                ),
                Center(
                  child: Text('Pindai QR Code ini di gerbong',
                      style: GoogleFonts.openSans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF96989C))),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Center(
                  child: QrImageView(
                    data: 'Coba',
                    version: QrVersions.auto,
                    size: 256.0,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
