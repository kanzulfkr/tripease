import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../view_model/order_ticket/response_order_train_provider.dart';
import '../invoice_page/factur_page.dart';

class PaymentStatus extends StatefulWidget {
  const PaymentStatus({super.key});

  @override
  State<PaymentStatus> createState() => _PaymentStatusState();
}

class _PaymentStatusState extends State<PaymentStatus> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 10),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FacturPage()),
      ),
    );
    var responseOrderProv =
        Provider.of<ResponseOrderTrainProvider>(context, listen: false);

    Future.microtask(() async {
      await responseOrderProv.getResponseOrder(80, 1);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF0080FF),
        title: Text(
          'Status Pembayaran',
          style: GoogleFonts.openSans(
              fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Consumer<ResponseOrderTrainProvider>(
        builder: (context, responseProv, child) {
          int infant = responseProv.dataOrder.quantityInfant ?? 0;
          int adult = responseProv.dataOrder.quantityAdult!;
          int price = responseProv.dataOrder.train!.trainPrice!;
          int totalHarga = adult * price;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/paymentstatus.png'),
              SizedBox(height: 135.h),
              Text(
                'Pembayaran Berhasil!',
                style: GoogleFonts.openSans(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.green),
              ),
              SizedBox(height: 20.h),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.train),
                    SizedBox(width: 10.w),
                    SizedBox(
                      width: 100.w,
                      child: Text(
                        '${responseProv.dataOrder.train!.name}',
                        style: GoogleFonts.openSans(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              // payment status,
              //// stationProv.pulangPergi ?
              // Center(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       const Icon(Icons.train),
              //       SizedBox(width: 10.w),
              //       SizedBox(
              //         width: 100.w,
              //         child: Text(
              //           '${responseProv.dataOrder.train!.name}',
              //           style: GoogleFonts.openSans(
              //               fontSize: 14.sp, fontWeight: FontWeight.w400),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              SizedBox(height: 20.h),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.person),
                    SizedBox(width: 10.w),
                    SizedBox(
                      width: 100.w,
                      child: Text(
                        '${(adult + infant).toString()} Orang',
                        style: GoogleFonts.openSans(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.payments),
                    SizedBox(width: 10.w),
                    SizedBox(
                      width: 100.w,
                      child: Text(
                        'Rp. ${(totalHarga)}',
                        style: GoogleFonts.openSans(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
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
