import 'package:capstone_project_tripease/features/profile/view/component/button_active.dart';
import 'package:capstone_project_tripease/features/profile/view/component/button_inactive.dart';
import 'package:flutter/material.dart';

class DialogLogout extends StatelessWidget {
  const DialogLogout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Keluar dari akun'),
      titleTextStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Sayang sekali, banyak keuntungan yang anda lewatkan. Apakah anda yakin untuk keluar?',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            ButtonActive(
              text: 'Ya',
              // colorText: Colors.white,
              // colorButton: const Color.fromRGBO(0, 128, 255, 1),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 12),
            ButtonInactive(
              text: 'Tidak',
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      actions: null,
    );
  }
}
