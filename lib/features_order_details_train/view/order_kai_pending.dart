import '/features_order/view_model/provider/train/train_order_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../features_order/utils/colors.dart';
import '../../features_order/utils/images.dart';
import '../../features_order/view_model/provider/coundown_provider.dart';
import '../../features_order/view_model/provider/train/train_order_update_provider.dart';

class OrderKaiPendingPage extends StatefulWidget {
  const OrderKaiPendingPage({super.key});

  @override
  State<OrderKaiPendingPage> createState() => _OrderKaiPendingPageState();
}

class _OrderKaiPendingPageState extends State<OrderKaiPendingPage> {
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
          int trainPrice = int.parse(orderDetail.getTrainPrice.toString());
          int quantityAdult =
              int.parse(orderDetail.getQuantityAdult.toString());

          int totalTransfer = trainPrice * quantityAdult;

          return Padding(
            padding: EdgeInsets.all(16.sp),
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 18.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: const Color(0xEEFFDB66),
                    ),
                    color: const Color(0xEEFFDB66).withOpacity(0.3),
                  ),
                  height: 40.h,
                  width: 328.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/schedule.svg',
                          width: 20.w,
                          height: 20.h,
                          color: const Color(0xEEFFC300)),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text(
                        'Menunggu Pembayaran',
                        style: GoogleFonts.openSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xEEFFC300),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
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
                      padding: EdgeInsets.all(12.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Detail Pesanan',
                              style: GoogleFonts.openSans(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF0080FF))),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 8.sp),
                                height: 79.h,
                                width: 79.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.r),
                                  child: train2,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(orderDetail.getStationOrigin ?? '',
                                          style: GoogleFonts.openSans(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      Icon(Icons.arrow_forward, size: 14.sp),
                                      Text(
                                          orderDetail.getStationDestination ??
                                              '',
                                          style: GoogleFonts.openSans(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.train_outlined,
                                        size: 12.sp,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(orderDetail.getNameTrain ?? '',
                                          style: GoogleFonts.openSans(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.event_seat_outlined,
                                          size: 12.sp),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(orderDetail.getClassTrain ?? '',
                                          style: GoogleFonts.openSans(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_month_outlined,
                                          size: 12.sp),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(orderDetail.getDateTime ?? '',
                                          style: GoogleFonts.openSans(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          )),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 1.sp,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nomor Pesanan: ',
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  )),
                              Expanded(
                                child: Text(
                                  orderDetail.getTicketOrderCode ?? '',
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
                      padding: EdgeInsets.all(16.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Selesaikan Pembayaran Sebelum',
                              style: GoogleFonts.openSans(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF0080FF))),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  orderDetail.getDateTime ?? '',
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
                                                StatusOrderTrainUpdateProvider>(
                                            context,
                                            listen: false);

                                        int? trainOrderId =
                                            orderDetail.getTrainOrderId;
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
                                                    style: GoogleFonts.openSans(
                                                      color: mainBlue,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        ).then((value) {
                                          orderProvider.updateOrderStatus(
                                              trainOrderId!, status);
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
                ),
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
                          padding: EdgeInsets.all(16.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Metode Pembayaran',
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
                                  Text(orderDetail.getTypePayment ?? '',
                                      style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      )),
                                  Expanded(
                                    child: Image.network(
                                        orderDetail.getImagePayment ?? '',
                                        width: 22.59.w,
                                        height: 16.h),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Nomor Rekening',
                                      style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      )),
                                  Text(orderDetail.getAccountNumber ?? '',
                                      style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Nama Penerima',
                                      style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      )),
                                  Text(orderDetail.getAccountName ?? '',
                                      style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      )),
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
                      padding: EdgeInsets.all(16.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Informasi Pembayaran',
                              style: GoogleFonts.openSans(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF0080FF))),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  '${orderDetail.getClassTrain ?? ''}, Dewasa x${orderDetail.getQuantityAdult ?? ''}, Anak x${orderDetail.getQuantityInfant ?? ''}',
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  )),
                              Text('Rp. ${orderDetail.getTrainPrice}',
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 1.sp,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Jumlah Transfer:',
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  )),
                              Text(
                                'Rp. ${totalTransfer.toStringAsFixed(2)}',
                                style: GoogleFonts.openSans(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  width: 328.w,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Mulai Pembayaran',
                      style: GoogleFonts.openSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                  width: 328.w,
                  height: 40.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xEEE1E4EA),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Hubungi Bantuan',
                      style: GoogleFonts.openSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xEE0080FF)),
                    ),
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
