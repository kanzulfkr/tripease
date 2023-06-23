import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../faktur_hotel/view/faktur_hotel_view.dart';
import '../../payment_hotel/viewmodel/order_viewmodel.dart';
import '../../payment_result/viewmodel/patch_order_viewmodel.dart';

class PaymentFinal extends StatefulWidget {
  const PaymentFinal({
    Key? key,
  }) : super(key: key);
  @override
  State<PaymentFinal> createState() => _PaymentFinalState();
}

class _PaymentFinalState extends State<PaymentFinal> {
  final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const FakturHotel(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PatchOrderProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Status Pembayaran'),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 80.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 269.w,
                        height: 269.h,
                        child: Image.asset('assets/images/verified.jpeg'),
                      ),
                      SizedBox(
                        height: 135.h,
                      ),
                      Column(
                        children: [
                          Text(
                            'Pembayaran Berhasil!',
                            style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                letterSpacing: 0.05,
                                color: Colors.green),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Column(
                            children: [
                              // SizedBox(
                              //   width: 24.w,
                              //   height: 24.h,
                              //   child: Image.asset('assets/images/Hotel.jpeg'),
                              // ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                value.data.hotel?.name ?? '',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  letterSpacing: 0.025,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 24.w,
                                height: 24.h,
                                child: Image.asset('assets/images/type.jpeg'),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                value.data.hotel?.hotelRoom?.name ?? '',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  letterSpacing: 0.025,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 24.w,
                                height: 24.h,
                                child: const Icon(Icons.payments),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                formatter.format(value.data.totalAmount),
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  letterSpacing: 0.025,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
