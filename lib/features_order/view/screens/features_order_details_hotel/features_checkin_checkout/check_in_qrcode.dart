
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../pesanan_screen.dart';
import 'check_out.dart';
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
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CheckOut(
                    title: 'Shibuya Shabu',
                  ),
                ));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                // child: QrImageView(
                //   data: CardHotel.cardHotel[0].noPesanan!,
                //   version: QrVersions.auto,
                //   size: 256.0,
                // ),
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
