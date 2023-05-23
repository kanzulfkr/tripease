import 'package:capstone_project_tripease/features/profile/view/change_password/change_password_screen.dart';
import 'package:capstone_project_tripease/features/profile/view/component/custom_dialog.dart';
import 'package:capstone_project_tripease/features/profile/view/component/menu_profile.dart';
import 'package:capstone_project_tripease/features/profile/view/edit_profile/edit_profile_screen.dart';
import 'package:capstone_project_tripease/features/profile/view/help_center/help_center_screen.dart';
import 'package:capstone_project_tripease/features/profile/view/language/language_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(240, 240, 248, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Profile',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  height: 84,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 128, 255, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 29,
                            backgroundImage:
                                AssetImage('assets/images/user.jfif'),
                          ),
                        ),
                        const SizedBox(
                          width: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sekar Mauliyah',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'sekarm13@gmail.com',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            width: 40,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const EditProfileScreen(
                                    title: 'Ubah Profile',
                                  ),
                                ));
                              },
                              child: const Icon(
                                Icons.edit_outlined,
                                color: Colors.white,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  width: double.maxFinite,
                  height: 224,
                  color: Colors.white,
                  child: Column(
                    children: [
                      MenuProfile(
                        iconName: Icons.person_2_outlined,
                        name: 'Ubah Profile',
                        description: 'Ubah profile Anda',
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const EditProfileScreen(
                              title: 'Ubah Profile',
                            ),
                          ));
                        },
                      ),
                      MenuProfile(
                        iconName: Icons.lock_outline,
                        name: 'Ubah Kata Sandi',
                        description: 'Ubah kata sandi Anda',
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ChangePasswordScreen(
                              title: 'Ubah Kata Sandi',
                            ),
                          ));
                        },
                      ),
                      MenuProfile(
                        iconName: Icons.logout_outlined,
                        name: 'Keluar',
                        description: 'Keluar dari akun Anda',
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CustomDialog(
                                title: 'Keluar dari akun',
                                content:
                                    'Sayang sekali, banyak keuntungan yang anda lewatkan. Apakah anda yakin untuk keluar?',
                                btnActive: 'Ya',
                                btnInactive: 'Tidak',
                                onTapActive: () {
                                  Navigator.of(context).pop();
                                },
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const Text(
                'Lainnya',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Container(
                  width: double.maxFinite,
                  height: 152,
                  color: Colors.white,
                  child: Column(
                    children: [
                      MenuProfile(
                        iconName: Icons.question_mark_outlined,
                        name: 'Pusat Bantuan',
                        description: 'Temukan jawaban terbaik Anda',
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HelpCenterScreen(
                              title: 'Pusat Bantuan',
                            ),
                          ));
                        },
                      ),
                      MenuProfile(
                        iconName: Icons.g_translate_outlined,
                        name: 'Bahasa / Language',
                        description: 'Pilih bahasa yang Anda inginkan',
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LanguageScreen(
                              title: 'Bahasa',
                            ),
                          ));
                        },
                      ),
                    ],
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
