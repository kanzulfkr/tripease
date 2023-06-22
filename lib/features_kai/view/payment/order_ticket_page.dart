import 'dart:async';
import 'package:capstone_project_tripease/features_kai/view_model/order_ticket/order_train_provider.dart';
import 'package:capstone_project_tripease/features_kai/view_model/station/departure_provider.dart';
import 'package:capstone_project_tripease/features_kai/view_model/train/train_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../view_model/timer/time_payment_provider.dart';
import 'widgets/list_payment.dart';
import 'widgets/payment_timer.dart';

class OrderTicket extends StatefulWidget {
  const OrderTicket({super.key});

  @override
  State<OrderTicket> createState() => _OrderTicketState();
}

class _OrderTicketState extends State<OrderTicket> {
  TimerPaymentProvider timerText = TimerPaymentProvider();
  Timer? countdownTimer;
  int selectedRadio = 0;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    TimerPaymentProvider timerPayment =
        Provider.of<TimerPaymentProvider>(context, listen: false);

    timerPayment.stopCountDown();
    timerPayment.startCountDown(context);
    countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (timerPayment.isTimeUp()) {
          countdownTimer?.cancel();

          Navigator.of(context).pop();
          showDialogWithContext(context);
        }
      },
    );
  }

  Future<dynamic> showDialogWithContext(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return const AlertDialog(
          title: Text('Time Up'),
          content: Text('The time has run out.'),
        );
      },
    );
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postOrderProv =
        Provider.of<PostOrderTrainProvider>(context, listen: false);
    final departureProv =
        Provider.of<DepartureProvider>(context, listen: false);
    int quantityAdult = postOrderProv.getQuantityAdult;

    int? price =
        departureProv.departure[departureProv.selectedDepartIndex as int].price;
    int totalHargaTiket = quantityAdult * price!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF0080FF),
        title: Text(
          'Order Ticket',
          style: GoogleFonts.openSans(
              fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Consumer<TrainProvider>(
        builder: (context, trainProv, child) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            child: Consumer<DepartureProvider>(
              builder: (context, departureProv, child) {
                return ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PaymentTimer(timerText: timerText),
                    SizedBox(height: 25.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40.w,
                          height: 30.h,
                        ),
                        SizedBox(
                          width: 100.w,
                          height: 30.h,
                          child: Text(
                            'Tiket',
                            style: GoogleFonts.openSans(
                                fontSize: 14.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          width: 130.w,
                          height: 30.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 30.h,
                                child: Text(
                                  // stationProv.pulangPergi ?
                                  // '(qwuantiti adult*2) X price'
                                  // :

                                  '${quantityAdult} x Rp. ${price}',
                                  style: GoogleFonts.openSans(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      height: 1.4.h,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 40.h,
                          height: 20.h,
                        ),
                        SizedBox(
                          width: 100.w,
                          child: Text(
                            'Subtotal',
                            style: GoogleFonts.openSans(
                                fontSize: 14.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          width: 130.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Rp. $totalHargaTiket',
                                style: GoogleFonts.openSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      height: 1.4.h,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 40.h,
                          height: 20.h,
                        ),
                        SizedBox(
                          width: 100.w,
                          child: Text(
                            'Total',
                            style: GoogleFonts.openSans(
                                fontSize: 14.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          width: 130.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Rp. $totalHargaTiket',
                                style: GoogleFonts.openSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const ListPayment(),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
