import 'package:capstone_project_tripease/features/profile/view/component/button_active.dart';
import 'package:capstone_project_tripease/features/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/undraw_success.svg',
              ),
              const SizedBox(height: 32),
              const Text(
                'Sukses mengubah Kata Sandi',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              const Text(
                'Kata Sandi telah diubah',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 64),
              ButtonActive(
                text: 'Selesai',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
