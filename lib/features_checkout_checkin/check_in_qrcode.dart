import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../features_pesanan/view/screens/pesanan_screen.dart';
import 'component/button_active.dart';

class CheckInQrcode extends StatefulWidget {
  const CheckInQrcode({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<CheckInQrcode> createState() => _CheckInQrcodeState();
}

class _CheckInQrcodeState extends State<CheckInQrcode> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 128, 255, 1),
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            Container(
              height: 90.h,
              width: double.maxFinite,
              margin: EdgeInsets.only(top: 20.h),
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.2.w,
                    blurRadius: 0.5.w,
                    offset: const Offset(0.5, 0.5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'QR Code Anda',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(0, 128, 255, 1),
                    ),
                  ),
                  Text(
                    'Arahkan QR Code ini dengan benar ke  pemindai. Pastikan untuk meningkatkan kecerahan layar ponsel Anda agar QR Code mudah dibaca.',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                  top: 58.h,
                  bottom: 56.h,
                ),
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.2.w,
                      blurRadius: 0.5.w,
                      offset: const Offset(0.5, 0.5),
                    ),
                  ],
                ),
                child: Image.asset('assets/images/qr_code.png'),
              ),
            ),
            ButtonActive(
              text: 'Hubungi Reservasi',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PesananScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
