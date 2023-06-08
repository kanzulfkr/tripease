import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hotel_1/faktur_hotel/view/faktur_hotel_view.dart';
import 'package:hotel_1/list_hotel/model/list_hotel_model.dart';

import '../../detail_hotel/model/detail_hotel_model.dart';
import '../../payment_hotel/model/payment_page_model.dart';

class PaymentFinal extends StatefulWidget {
  final Room room;
  final ListHotel list;
  final PaymentMethod paymentMethod;

  const PaymentFinal({Key? key, required this.room, required this.list, required this.paymentMethod}) : super(key: key);
  @override
  State<PaymentFinal> createState() => _PaymentFinalState();
}

class _PaymentFinalState extends State<PaymentFinal> {
  @override
  void initState() {
    super.initState();
    // Start a timer when the screen is built
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FakturHotel(room: widget.room, list: widget.list, paymentMethod: widget.paymentMethod,),), // Replace YourNextPage() with the actual next page widget
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Status Pembayaran'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    width: 269,
                    height: 269,
                    child: Image.asset('assets/images/verified.jpeg'),
                  ),
                  SizedBox(height: 135,),
                  Container( //This Container should be in center
                    child: Column(
                      children: [
                        Text(
                          'Pembayaran Berhasil!',
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            letterSpacing: 0.05,
                            color: Colors.green
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                child: Image.asset('assets/images/Hotel.jpeg'),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                widget.list.name,
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: 0.025,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                child: Image.asset('assets/images/type.jpeg'),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                (widget.room.name),
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: 0.025,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                child: Icon(Icons.payments),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                widget.room.total,
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: 0.025,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}