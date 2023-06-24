import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../view_model/order_ticket/order_train_provider.dart';
import '../../view_model/order_ticket/response_order_train_provider.dart';
import '../../view_model/station/departure_provider.dart';
import '../../view_model/station/return_provider.dart';
import '../../view_model/station/station_provider.dart';
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
    final postOrderProv =
        Provider.of<PostOrderTrainProvider>(context, listen: false);
    final returnProv = Provider.of<ReturnProvider>(context, listen: false);
    final stationProv = Provider.of<StationProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF0080FF),
        title: Text(
          'Status Pembayaran',
          style:
              GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Consumer<DepartureProvider>(
        builder: (context, departureProv, child) {
          int quantityAdult = postOrderProv.getQuantityAdult;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/paymentstatus.png'),
              const SizedBox(height: 135),
              Text(
                'Pembayaran Berhasil!',
                style: GoogleFonts.openSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.green),
              ),
              const SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.train),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 100,
                      child: Text(
                        '${departureProv.departure[departureProv.selectedDepartIndex as int].name}',
                        style: GoogleFonts.openSans(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // payment status,
              stationProv.pulangPergi
                  ? Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.train),
                            SizedBox(width: 10),
                            SizedBox(
                              width: 100,
                              child: Text(
                                '${returnProv.returns[returnProv.selectedDepartIndex as int].name}',
                                style: GoogleFonts.openSans(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.person),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 100,
                      child: Text(
                        '${(quantityAdult).toString()} Orang',
                        style: GoogleFonts.openSans(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.payments),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 100,
                      child: Text(
                        stationProv.pulangPergi
                            ? 'Rp.${quantityAdult * ((returnProv.returns[returnProv.selectedDepartIndex as int].price!) + (departureProv.departure[departureProv.selectedDepartIndex as int].price!))}'
                            : 'Rp. ${(departureProv.departure[departureProv.selectedDepartIndex as int].price!) * quantityAdult}',
                        style: GoogleFonts.openSans(
                            fontSize: 14, fontWeight: FontWeight.w400),
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
