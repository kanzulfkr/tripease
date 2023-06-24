import 'dart:async';
import '/features_kai/view_model/order_ticket/order_train_provider.dart';
import '/features_kai/view_model/station/departure_provider.dart';
import '/features_kai/view_model/station/station_provider.dart';
import '/features_kai/view_model/train/train_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../view_model/station/return_provider.dart';
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
    final stationProv = Provider.of<StationProvider>(context, listen: false);

    final postOrderProv =
        Provider.of<PostOrderTrainProvider>(context, listen: false);
    final departureProv =
        Provider.of<DepartureProvider>(context, listen: false);
    final returnProv = Provider.of<ReturnProvider>(context, listen: false);

    int quantityAdult = postOrderProv.getQuantityAdult;

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
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PaymentTimer(timerText: timerText),
                SizedBox(height: 25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30.h,
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 150.w,
                      height: 30.h,
                      child: Text(
                        stationProv.pulangPergi
                            ? 'Tiket Keberangkatan'
                            : 'Tiket',
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
                              '$quantityAdult x Rp. ${departureProv.departure[departureProv.selectedDepartIndex as int].price!}',
                              style: GoogleFonts.openSans(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
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
                stationProv.pulangPergi
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 30.h,
                            height: 20.h,
                          ),
                          SizedBox(
                            width: 150.w,
                            child: Text(
                              'Tiket Pulang',
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
                                  '$quantityAdult x Rp.${returnProv.returns[returnProv.selectedDepartIndex as int].price!}',
                                  style: GoogleFonts.openSans(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
                stationProv.pulangPergi
                    ? Container(
                        margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                        height: 1.4.h,
                        color: Colors.black,
                      )
                    : SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 30.h,
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 150.w,
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
                            stationProv.pulangPergi
                                ? 'Rp.${quantityAdult * ((returnProv.returns[returnProv.selectedDepartIndex as int].price!) + (departureProv.departure[departureProv.selectedDepartIndex as int].price!))}'
                                : 'Rp. ${(departureProv.departure[departureProv.selectedDepartIndex as int].price!) * quantityAdult}',
                            style: GoogleFonts.openSans(
                                fontSize: 14.sp, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const ListPayment(),
              ],
            ),
          );
        },
      ),
    );
  }
}
