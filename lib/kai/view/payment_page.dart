import 'package:capstone_project_tripease/kai/view/invoice_page.dart';
import 'package:capstone_project_tripease/kai/view_model/time_payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_string/random_string.dart';

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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 20, bottom: 9),
                  child: Text(
                    'Waktu Pembayaran',
                    style: GoogleFonts.openSans(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 12, left: 220),
                  child: Obx(
                    () => Text(
                      timerText.timer.value,
                      style: GoogleFonts.openSans(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
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
            Center(
              child: Container(
                height: 240,
                width: 340,
                margin: EdgeInsets.only(top: 28.5),
                padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFFF0F0F8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Kartu Kredit/Debit",
                              style: GoogleFonts.openSans(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            const Icon(
                              Icons.credit_card,
                              color: Colors.black,
                            )
                          ],
                        ),
                        value: 1,
                        groupValue: selectedRadio,
                        onChanged: (value) {
                          setState(() {
                            selectedRadio = value as int;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Virtual Account",
                              style: GoogleFonts.openSans(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Image.asset('assets/images/bank-account.png'),
                          ],
                        ),
                        value: 2,
                        groupValue: selectedRadio,
                        onChanged: (value) {
                          setState(() {
                            selectedRadio = value as int;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ovo",
                              style: GoogleFonts.openSans(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Image.asset('assets/images/logo-ovo-pay.png')
                          ],
                        ),
                        value: 3,
                        groupValue: selectedRadio,
                        onChanged: (value) {
                          setState(() {
                            selectedRadio = value as int;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Gopay",
                              style: GoogleFonts.openSans(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Image.asset('assets/images/gopay.png'),
                          ],
                        ),
                        value: 4,
                        groupValue: selectedRadio,
                        onChanged: (value) {
                          setState(() {
                            selectedRadio = value as int;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Minimarket",
                              style: GoogleFonts.openSans(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Image.asset('assets/images/storefront.png'),
                          ],
                        ),
                        value: 5,
                        groupValue: selectedRadio,
                        onChanged: (value) {
                          setState(() {
                            selectedRadio = value as int;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Bayar di Loket",
                              style: GoogleFonts.openSans(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Image.asset('assets/images/ticket_office.png'),
                          ],
                        ),
                        value: 6,
                        groupValue: selectedRadio,
                        onChanged: (value) {
                          setState(() {
                            selectedRadio = value as int;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 200),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String orderNumber = randomAlphaNumeric(8);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          InvoicePage(orderNumber: orderNumber),
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
                    primary:
                        const Color(0XFF0080FF) // Warna latar belakang biru
                    ),
                child: Text(
                  'Bayar',
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // Warna teks putih
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
