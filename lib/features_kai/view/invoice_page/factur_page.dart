import 'package:capstone_project_tripease/features_kai/view_model/order_ticket/response_order_train_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../main_page.dart';
import 'ticket_booking.dart';

class FacturPage extends StatefulWidget {
  const FacturPage({super.key});

  @override
  State<FacturPage> createState() => _FacturPageState();
}

class _FacturPageState extends State<FacturPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF0080FF),
        title: Text(
          'Faktur',
          style: GoogleFonts.openSans(
              fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Consumer<ResponseOrderTrainProvider>(
        builder: (context, responseProv, child) {
          int quantityAdult = responseProv.dataOrder.quantityAdult!;
          int price = responseProv.dataOrder.train!.trainPrice!;
          int totalHarga = quantityAdult * price;

          // int price
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 18.h),
                child: Text(
                  'No.${responseProv.dataOrder.ticketOrderCode}',
                  style: GoogleFonts.openSans(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              const TicketBooking(),
              SizedBox(height: 25.h),
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
                      '$quantityAdult x Rp. $price',
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
                          'Rp. $totalHarga',
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
                    Image.network(
                      '${responseProv.dataOrder.payment!.imageUrl}',
                      width: 50.w,
                      height: 30.h,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 96.h,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(252, 40),
                      backgroundColor: const Color(0XFF0080FF), // Ukuran tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            5), // Sudut melengkung dengan jari-jari 5
                      ),
                      padding: const EdgeInsets.fromLTRB(
                          24, 0, 24, 0) // Warna latar belakang biru
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
          );
        },
      ),
    );
  }
}
