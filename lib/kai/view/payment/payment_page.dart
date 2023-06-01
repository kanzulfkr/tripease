import 'package:capstone_project_tripease/kai/view/payment/payment_va.dart';
import 'package:capstone_project_tripease/kai/view/payment/payment_timer.dart';
import 'package:capstone_project_tripease/kai/view/payment/select_payment.dart';
import 'package:capstone_project_tripease/kai/view_model/time_payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TimerPayment timerText = Get.put(TimerPayment());
  int selectedRadio = 0;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pembayaran',
          style:
              GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: 800,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentTimer(timerText: timerText),
            Padding(
              padding: const EdgeInsets.only(left: 56),
              child: Row(
                children: [
                  Text(
                    'Tiket',
                    style: GoogleFonts.openSans(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 200),
                  Text(
                    '8 x Rp. 15.000',
                    style: GoogleFonts.openSans(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Text(
                    'Asuransi',
                    style: GoogleFonts.openSans(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 185),
                  Text(
                    '8 x Rp. 3.000',
                    style: GoogleFonts.openSans(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: 400,
                height: 1,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 56),
                  child: Text(
                    'Subtotal',
                    style: GoogleFonts.openSans(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(width: 190),
                Text(
                  'Rp. 144.000',
                  style: GoogleFonts.openSans(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: 400,
                height: 1,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 56),
                  child: Text(
                    'Total',
                    style: GoogleFonts.openSans(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(width: 210),
                Text(
                  'Rp. 144.000',
                  style: GoogleFonts.openSans(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SelectPayment(),
            const SizedBox(height: 20),
            const ButtonPayment(),
          ],
        ),
      ),
    );
  }
}

class ButtonPayment extends StatelessWidget {
  const ButtonPayment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // String orderNumber = randomAlphaNumeric(8);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => InvoicePage(orderNumber: orderNumber),
          //   ),
          // );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaymentVA(timerText: TimerPayment()),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(252, 40), // Ukuran tombol
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  5), // Sudut melengkung dengan jari-jari 5
            ),
            padding: const EdgeInsets.fromLTRB(
                24, 0, 24, 0), // Padding di kiri dan kanan
            primary: const Color(0XFF0080FF) // Warna latar belakang biru
            ),
        child: Text(
          'Lanjut',
          style: GoogleFonts.openSans(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white, // Warna teks putih
          ),
        ),
      ),
    );
  }
}
