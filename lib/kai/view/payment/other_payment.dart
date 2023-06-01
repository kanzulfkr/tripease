import 'package:capstone_project_tripease/kai/view/invoice_page/ticket_booking.dart';
import 'package:capstone_project_tripease/kai/view/payment/payment_status.dart';
import 'package:capstone_project_tripease/kai/view_model/time_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherPayment extends StatefulWidget {
  const OtherPayment({super.key, required this.timerText});

  final TimerPayment timerText;
  @override
  State<OtherPayment> createState() => _OtherPaymentState();
}

class _OtherPaymentState extends State<OtherPayment> {
  bool isDropdownOpened = false;
  List<String> dropdownItems = [
    '1. Pilih opsi pembayaran dengan OVO/Gopay/Minimarket dan lainnya pada halaman pembayaran.',
    '2. Setelah itu klik tombol bayar.',
    '3. Anda akan diarahkan ke aplikasi yang dipilih untuk melakukan pembayaran. Pastikan nomor yang terhubung dengan akun dompet digital yang akan digunakan pembayaran.',
    '4. Jika akun dompet digital telah terhubung dengan benar, masukan PIN pada halaman pembayaran.',
    '5. Tunggu hingga muncul notifikasi yang mengkonfirmasi bahwa pembayaran telah berhasil dilakukan.',
  ];
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Waktu Pembayaran',
                  style: GoogleFonts.openSans(
                      fontSize: 12.sp, fontWeight: FontWeight.w600),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 12, left: 200),
                  child: Obx(
                    () => Text(
                      widget.timerText.timer.value,
                      style: GoogleFonts.openSans(
                          fontSize: 12.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: const Color(0xFFF5F6F8),
                height: 51.h,
                width: 280.w,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/ovo.png',
                        height: 35.h,
                        width: 55.w,
                      ),
                      SizedBox(width: 12.w),
                      Column(
                        children: [
                          Text(
                            'Total Biaya',
                            style: GoogleFonts.openSans(
                                fontSize: 14.sp, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text(
                                'Rp. ',
                                style: GoogleFonts.openSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Icon(
                                Icons.content_copy,
                                size: 13,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isDropdownOpened = !isDropdownOpened;
                });
              },
              child: Container(
                height: 40.h,
                width: 500.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Cara Pembayaran',
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 200.w,
                    ),
                    Icon(isDropdownOpened
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down)
                  ],
                ),
              ),
            ),
            Expanded(
              child: Visibility(
                visible: isDropdownOpened,
                child: Container(
                  height: 420.h,
                  width: 304.w,
                  child: ListView.builder(
                    itemCount: dropdownItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      String item = dropdownItems[index];
                      return ListTile(
                        title: Text(
                          item,
                          maxLines: 19,
                          style: GoogleFonts.openSans(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            if (isDropdownOpened)
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PaymentStatus()),
                );
                Future.delayed(const Duration(seconds: 3), () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TicketBooking()),
                    (route) => false,
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(252, 40), // Ukuran tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      5), // Sudut melengkung dengan jari-jari 5
                ),
                padding: const EdgeInsets.fromLTRB(
                    24, 0, 24, 0), // Padding di kiri dan kanan
                primary: const Color(0XFF0080FF), // Warna latar belakang biru
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
          ],
        ),
      ),
    );
  }
}
