import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import '../../payment_final/view/payment_final_view.dart';
import '../../payment_hotel/viewmodel/order_viewmodel.dart';
import '../../payment_hotel/viewmodel/payment_hotel_viewmodel.dart';
import '../viewmodel/patch_order_viewmodel.dart';
import '../viewmodel/payment_result_viewmodel.dart';

class VirtualAccountPage extends StatefulWidget {
  const VirtualAccountPage({super.key});

  @override
  VirtualAccountPageState createState() => VirtualAccountPageState();
}

class VirtualAccountPageState extends State<VirtualAccountPage> {
  late Timer _timer;
  int _secondsRemaining = 600;
  bool isBayar = false;

  @override
  void initState() {
    super.initState();
    final paymentProv =
        Provider.of<PaymentHotelProvider>(context, listen: false);
    final paymentByIdProv =
        Provider.of<DetailPaymentProvider>(context, listen: false);

    Future.microtask(() async {
      await paymentByIdProv.getDetailPayment(paymentProv.paymentId);
    });

    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to prevent further executions
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else if (_secondsRemaining > 0 && isBayar == true) {
        timer.cancel();
      } else {
        timer.cancel();
        showPopup();
      }
    });
  }

  void showPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Waktu Pembayaran Habis'),
          content: const Text('Silakan kembali ke halaman sebelumnya.'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    final minutesString = minutes.toString().padLeft(2, '0');
    final secondsString = remainingSeconds.toString().padLeft(2, '0');
    return '$minutesString:$secondsString';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 32.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Waktu Pembayaran',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          letterSpacing: 0.04,
                        ),
                      ),
                      Text(
                        formatTime(_secondsRemaining),
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          letterSpacing: 0.04,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Consumer<DetailPaymentProvider>(
                    builder: (context, detailPaymentProv, child) {
                      return Container(
                        width: 280,
                        padding: EdgeInsets.fromLTRB(20.sp, 8.sp, 20.sp, 8.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.r),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          children: [
                            Image.network(
                              "${detailPaymentProv.detailPayment.imageUrl}",
                              width: 24.w,
                              height: 24.h,
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    detailPaymentProv.detailPayment.name
                                        .toString(),
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                      letterSpacing: 0.15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    detailPaymentProv
                                        .detailPayment.accountNumber
                                        .toString(),
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      letterSpacing: 0.04,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  ExpansionTile(
                    title: Text(
                      'Cara Pembayaran',
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                        letterSpacing: 0.025,
                      ),
                    ),
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(16.sp, 8.sp, 16.sp, 8.sp),
                        // child: Column(
                        //   children: [
                        //     for (final howTo
                        //         in widget.virtualAccountOption.howTo)
                        //       Column(
                        //         children: [
                        //           Row(
                        //             children: [
                        //               Text(
                        //                 howTo,
                        //                 style: TextStyle(
                        //                   fontFamily: 'Open Sans',
                        //                   fontWeight: FontWeight.w400,
                        //                   fontSize: 14,
                        //                   letterSpacing: 0.04,
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //           SizedBox(
                        //             height: 6,
                        //           )
                        //         ],
                        //       ),
                        //   ],
                        // ),
                      )
                    ],
                  ),
                  DividerTheme(
                    data: DividerThemeData(
                      color: Colors.black, // Set the color to black
                      thickness: 1.0
                          .sp, // Increase or decrease the thickness as desired
                    ),
                    child: const Divider(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0.sp, 20.0.sp, 16.0.sp, 20.0.sp),
          child: SizedBox(
            height: 56.0.h,
            child: ElevatedButton(
              onPressed: () async {
                final orderProv =
                    Provider.of<OrderProviderHotel>(context, listen: false);
                final patchOrder =
                    Provider.of<PatchOrderProvider>(context, listen: false);

                await patchOrder.patchOrderHotel(
                    orderProv.data.hotelOrderId as int, "paid");
                isBayar = true;
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Tunggu Sebentar'),
                    ),
                  );
                }
                await Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentFinal(),
                    ),
                  );
                });
              },
              child: Text(
                'Bayar',
                style: TextStyle(fontSize: 18.0.sp),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
