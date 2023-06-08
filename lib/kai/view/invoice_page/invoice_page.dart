import 'package:capstone_project_tripease/kai/view/invoice_page/code_payment.dart';
import 'package:capstone_project_tripease/kai/view/invoice_page/ticket_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InvoicePage extends StatelessWidget {
  final String orderNumber;

  InvoicePage({required this.orderNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Faktur',
          style: GoogleFonts.openSans(
              fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // PrintBarcode(orderNumber: orderNumber),
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 18.h),
            child: CodePayment(orderNumber: orderNumber),
          ),
          SizedBox(
            height: 16.h,
          ),
          const TicketBooking(),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tiket',
                  style: GoogleFonts.openSans(
                      fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                Text(
                  '8 x Rp. 15.000',
                  style: GoogleFonts.openSans(
                      fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(height: 17.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Asuransi',
                  style: GoogleFonts.openSans(
                      fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                Text(
                  '8 x Rp. 3.000',
                  style: GoogleFonts.openSans(
                      fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),

          SizedBox(height: 17.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: 400.w,
              height: 1.h,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 17.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: GoogleFonts.openSans(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Rp. 144.000',
                      style: GoogleFonts.openSans(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 17.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pay With',
                  style: GoogleFonts.openSans(
                      fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                Image.asset(
                  'assets/images/logo-ovo-pay.png',
                  width: 50.w,
                  height: 20.h,
                )
              ],
            ),
          ),
          SizedBox(
            height: 96.h,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
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
                'Cek Pesanan',
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
    );
  }
}
