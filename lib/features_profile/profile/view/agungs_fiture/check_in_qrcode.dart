import 'package:capstone_project_tripease/features_profile/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'component/button_active.dart';

class CheckInQrcode extends StatefulWidget {
  const CheckInQrcode({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<CheckInQrcode> createState() => _CheckInQrcodeState();
}

class _CheckInQrcodeState extends State<CheckInQrcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 128, 255, 1),
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 90,
              width: double.maxFinite,
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.2,
                    blurRadius: 0.5,
                    offset: const Offset(0.5, 0.5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'QR Code Anda',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 128, 255, 1),
                    ),
                  ),
                  const Text(
                    'Arahkan QR Code ini dengan benar ke  pemindai. Pastikan untuk meningkatkan kecerahan layar ponsel Anda agar QR Code mudah dibaca.',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 58, bottom: 56),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0.2,
                      blurRadius: 0.5,
                      offset: const Offset(0.5, 0.5),
                    ),
                  ],
                ),
                child: SvgPicture.asset('assets/svg/qr.svg'),
              ),
            ),
            ButtonActive(
              text: 'Hubungi Reservasi',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
