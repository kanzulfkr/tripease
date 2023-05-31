import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../features_pesanan/utils/images.dart';

class OrderKaiRefundSuccessPage extends StatelessWidget {
  const OrderKaiRefundSuccessPage({super.key});

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
                      'Pesananmu Berhasil Dikembalikan',
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
                  width: 328.w,
                  child: Card(
                      shadowColor: Colors.black.withOpacity(1),
                      elevation: 4.sp,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Detail Pesanan',
                                style: GoogleFonts.openSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF0080FF))),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 8.sp),
                                  height: 79.h,
                                  width: 79.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4.r),
                                    child: kereta1,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Surabaya',
                                            style: GoogleFonts.openSans(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                            )),
                                        Icon(Icons.arrow_forward, size: 14.sp),
                                        Text('Jakarta',
                                            style: GoogleFonts.openSans(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.train_outlined,
                                          size: 12.sp,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text('Argo Bromo',
                                            style: GoogleFonts.openSans(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.view_day_outlined,
                                            size: 12.sp),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text('Sabtu',
                                            style: GoogleFonts.openSans(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_month_outlined,
                                            size: 12.sp),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text('29 April 2023 - 29 April 2023',
                                            style: GoogleFonts.openSans(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                            )),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 1.sp,
                            ),
                            Text('Nomor Pesanan: 74384082',
                                style: GoogleFonts.openSans(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                      ))),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                  width: 328.w,
                  child: Card(
                      shadowColor: Colors.black.withOpacity(1),
                      elevation: 4.sp,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Metode Pembayaran',
                                style: GoogleFonts.openSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF0080FF))),
                            SizedBox(
                              height: 8.h,
                            ),
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
                          ],
                        ),
                      ))),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                  width: 328.w,
                  child: Card(
                      shadowColor: Colors.black.withOpacity(1),
                      elevation: 4.sp,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Informasi Pembayaran',
                                style: GoogleFonts.openSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF0080FF))),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Ekonomi (P) Dewasa x1, Anak x1',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Text('Rp  480.000',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Promo',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Text('-Rp  5.000',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Pajak',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Text('Rp  38.924',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Alasan Pengembalian',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Text('Double Booking',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
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
                  onPressed: () {},
                  child: Text(
                    'Kembali Ke Beranda',
                    style: GoogleFonts.openSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFFFFFF)),
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                width: 328.w,
                height: 40.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xEEE1E4EA),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Hubungi Bantuan',
                    style: GoogleFonts.openSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xEE0080FF)),
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
