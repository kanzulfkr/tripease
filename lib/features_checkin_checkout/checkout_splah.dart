import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../features_order/view/screens/pesanan_screen.dart';

class CheckOutSplash extends StatefulWidget {
  const CheckOutSplash({super.key});

  @override
  State<CheckOutSplash> createState() => _CheckOutSplashState();
}

class _CheckOutSplashState extends State<CheckOutSplash> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PesananScreen()),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/check_out.png'),
          Padding(
            padding: const  EdgeInsets.all(16),
            child: Text(
              'Terima kasih telah menggunakan aplikasi booking hotel kami! Semoga pengalaman menginap Anda menyenangkan. Sampai jumpa di kesempatan berikutnya!',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
