import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../detail_hotel/model/detail_hotel_model.dart';
import '../../list_hotel/model/list_hotel_model.dart';
import '../../payment_final/view/payment_final_view.dart';
import '../../payment_hotel/model/order_model.dart';

class PaymentResultPage extends StatefulWidget {
  const PaymentResultPage({
    Key? key,
  }) : super(key: key);

  @override
  _PaymentResultPageState createState() => _PaymentResultPageState();
}

class _PaymentResultPageState extends State<PaymentResultPage> {
  late Timer _timer;
  int _secondsRemaining = 300;

  @override
  void initState() {
    super.initState();
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
                Navigator.pop(context); // Close the dialog
                Navigator.pop(context); // Go back to the previous page
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
            const SizedBox(
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Waktu Pembayaran',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          letterSpacing: 0.04,
                        ),
                      ),
                      Text(
                        formatTime(_secondsRemaining),
                        style: const TextStyle(
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          letterSpacing: 0.04,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Container(
                    width: 280,
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: const Row(
                      children: [
                        // Container(
                        //   child: Image.asset(
                        //     widget.paymentMethod.imageAsset,
                        //   ),
                        // ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text(
                              //   widget.paymentMethod.subtitle,
                              //   style: TextStyle(
                              //     fontFamily: 'Open Sans',
                              //     fontWeight: FontWeight.w400,
                              //     fontSize: 10,
                              //     letterSpacing: 0.15,
                              //   ),
                              // ),
                              SizedBox(
                                height: 2,
                              ),
                              // Text(
                              //   widget.room.total,
                              //   style: TextStyle(
                              //     fontFamily: 'Open Sans',
                              //     fontWeight: FontWeight.w400,
                              //     fontSize: 14,
                              //     letterSpacing: 0.04,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ExpansionTile(
                    title: const Text(
                      'Cara Pembayaran',
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        letterSpacing: 0.025,
                      ),
                    ),
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        // child: Column(
                        //   children: [
                        //     for (final howTo in widget.paymentMethod.howTo)
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
                  const DividerTheme(
                    data: DividerThemeData(
                      color: Colors.black, // Set the color to black
                      thickness:
                          1.0, // Increase or decrease the thickness as desired
                    ),
                    child: Divider(),
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
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => PaymentFinal(
                //       room: widget.room,
                //       list: widget.list,
                //       paymentMethod: widget.paymentMethod,
                //     ),
                //   ),
                // );
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
