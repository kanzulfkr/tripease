import 'dart:async';

import 'package:capstone_project_tripease/features_profile/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';

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
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/splah_checkout.png'),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Terima kasih telah menggunakan aplikasi booking hotel kami! Semoga pengalaman menginap Anda menyenangkan. Sampai jumpa di kesempatan berikutnya!',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
