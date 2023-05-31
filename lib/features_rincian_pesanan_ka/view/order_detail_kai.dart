import 'package:capstone_project_tripease/features_rincian_pesanan_ka/view/print_qr_kai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../features_pesanan/utils/colors.dart';
import 'order_kai_cancelled.dart';

class OrderDetailKai extends StatelessWidget {
  const OrderDetailKai({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.h),
        child: AppBar(
          toolbarHeight: 48.h,
          title: Text(
            'Rincian Pesanan',
            style: GoogleFonts.openSans(
                fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 18.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: const Color(0xEE94E97C),
                  ),
                  color: const Color(0xEE94E97C).withOpacity(0.3),
                ),
                height: 40.h,
                width: 328.w,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/check_circle.svg',
                        width: 20.w,
                        height: 20.h,
                        color: const Color(0xEE4CDB24)),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      'Pesananmu Sudah Dibayar',
                      style: GoogleFonts.openSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xEE4CDB24),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                  height: 232.h,
                  width: 328.w,
                  child: Card(
                      shadowColor: Colors.black.withOpacity(1),
                      elevation: 4.sp,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 12.sp, right: 12.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Detail Pesanan',
                                style: GoogleFonts.openSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF0080FF))),
                            SizedBox(
                              height: 8.h,
                            ),
                            SizedBox(
                              height: 21.h,
                              width: 50.84.w,
                              child: Image.asset(
                                'assets/images/KAI.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'Argo Bromo (282)',
                              style: GoogleFonts.openSans(
                                  fontSize: 12.sp, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'Ekonomi (P)',
                              style: GoogleFonts.openSans(
                                  fontSize: 10.sp, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text('Nomor Pesanan: 2041720011',
                                style: GoogleFonts.openSans(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400)),
                            Divider(
                              thickness: 1.sp,
                              color: Colors.grey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Surabaya',
                                  style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text('Jakarta',
                                    style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '08:00',
                                  style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(Icons.arrow_forward, size: 12.sp),
                                Text('23:45',
                                    style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('29 April 2023',
                                    style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600)),
                                Text('15 j 15 m',
                                    style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600)),
                                Text('29 April 2023',
                                    style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600))
                              ],
                            )
                          ],
                        ),
                      ))),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                  height: 218.h,
                  width: 328.w,
                  child: Card(
                      shadowColor: Colors.black.withOpacity(1),
                      elevation: 4.sp,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.sp, top: 8.sp, right: 16.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Detail Pembayaran',
                                style: GoogleFonts.openSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF0080FF))),
                            Text('Argo Bromo (282) /Ekonomi',
                                style: GoogleFonts.openSans(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Dewasa x 1',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Text('Rp 450.000',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ))
                              ],
                            ),
                            Text('Layanan Tambahan',
                                style: GoogleFonts.openSans(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Asuransi x 1',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Text('Rp 5.000',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ))
                              ],
                            ),
                            Text('Metode Pembayaran',
                                style: GoogleFonts.openSans(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Virtual Account BRI',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Image.asset('assets/images/bri.png',
                                    width: 22.59.w, height: 16.h)
                              ],
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 1.sp,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Harga',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    )),
                                Text('Rp 455.000',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ))),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                width: 328.w,
                height: 40.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PrintQrKai(),
                    ));
                  },
                  child: Text(
                    'Cetak QR Code',
                    style: GoogleFonts.openSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFFFFFF)),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                width: 328.w,
                height: 40.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xEEE1E4EA),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Container(
                            height: 178.h,
                            width: 220.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Apakah Anda yakin ingin membatalkan pesanan ini?',
                                  style: GoogleFonts.openSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 44.sp, right: 44.sp),
                                  child: SizedBox(
                                      height: 40.h,
                                      width: 132.w,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                const OrderKaiCancelledPage(),
                                          ));
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFFDB2D24),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        5.r))),
                                        child: Text(
                                          'Ya',
                                          style: GoogleFonts.openSans(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 44.sp, right: 44.sp, top: 8.sp),
                                  child: SizedBox(
                                      height: 40.h,
                                      width: 132.w,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFF0080FF),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        5.r))),
                                        child: Text(
                                          'Tidak',
                                          style: GoogleFonts.openSans(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    'Batalkan Pesanan',
                    style: GoogleFonts.openSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xEE0080FF),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
