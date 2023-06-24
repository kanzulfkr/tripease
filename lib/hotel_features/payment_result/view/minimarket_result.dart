import 'dart:async';

import 'package:flutter/material.dart';

import '../../detail_hotel/model/detail_hotel_model.dart';
import '../../list_hotel/model/list_hotel_model.dart';
import '../../payment_final/view/payment_final_view.dart';
import '../../payment_hotel/model/order_model.dart';

class MinimarketPage extends StatefulWidget {
  @override
  _MinimarketPageState createState() => _MinimarketPageState();
}

class _MinimarketPageState extends State<MinimarketPage> {
  late Timer _timer;
  int _secondsRemaining = 300;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          timer.cancel();
          showPopup();
        }
      });
    });
  }

  void showPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Waktu Pembayaran Habis'),
          content: Text('Silakan kembali ke halaman sebelumnya.'),
          actions: [
            TextButton(
              child: Text('OK'),
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
        title: Text('Pembayaran'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
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
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            letterSpacing: 0.04,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    width: 280,
                    padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      children: [
                        // Container(
                        //   child: Image.asset(
                        //     widget.minimarketOption.imageAsset,
                        //     width: 40,
                        //     height: 30,
                        //   ),
                        // ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(
                                //   widget.minimarketOption.title,
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
                                //   widget.minimarketOption.paymentCode,
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ExpansionTile(
                    title: Text(
                      'Cara Pembayaran',
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        letterSpacing: 0.025,
                      ),
                    ),
                    children: <Widget>[
                      // Container(
                      //   padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      //   child: Column(
                      //     children: [
                      //       for (final howTo in widget.minimarketOption.howTo)
                      //         Column(
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 Text(
                      //                   howTo,
                      //                   style: TextStyle(
                      //                     fontFamily: 'Open Sans',
                      //                     fontWeight: FontWeight.w400,
                      //                     fontSize: 14,
                      //                     letterSpacing: 0.04,
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //             SizedBox(
                      //               height: 6,
                      //             )
                      //           ],
                      //         ),
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                  DividerTheme(
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
          padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
          child: Container(
            height: 56.0,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => PaymentFinal(room: widget.room, list: widget.list, virtualAccountOption: widget.virtualAccountOption, paymentMethod: widget.,),
                //   ),
                // );
              },
              child: Text(
                'Bayar',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
