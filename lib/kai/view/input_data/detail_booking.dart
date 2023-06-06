import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyDetailBooking extends StatelessWidget {
  const BodyDetailBooking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: const Color(0xF9FAFBFB),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.2,
            blurRadius: 0.5,
            offset: const Offset(0.5, 0.5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama',
              style: GoogleFonts.openSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Nama Pemesan',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'Nomor Telepon',
              style: GoogleFonts.openSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Nomor telepon (diawali 0)',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'Email',
              style: GoogleFonts.openSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email Pemesan',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              height: 150.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 219, 215, 215),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.2,
                    blurRadius: 0.5,
                    offset: const Offset(0.5, 0.5),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 25.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.info_rounded,
                          color: Colors.blue,
                        ),
                        Text(
                          "Info",
                          style: GoogleFonts.openSans(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Text(
                          'Data Pemesan hanya digunakan untuk mengirim invoice melalui email dan segala yang berhubungan dengan transaksi. Privasi data tetap terjaga',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines:
                              6, // Jumlah maksimum baris yang ingin ditampilkan
                          overflow: TextOverflow
                              .ellipsis, // Tindakan yang diambil saat teks melampaui jumlah maksimum baris
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Aksi yang ingin dilakukan saat tombol ditekan
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
                  'Tambahkan sebagai Penumpang',
                  style: GoogleFonts.openSans(
                    fontSize: 14.sp,
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
