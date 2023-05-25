import 'package:capstone_project_tripease/features_profile/profile/view/agungs_fiture/check_in.dart';
import 'package:capstone_project_tripease/features_profile/profile/view/agungs_fiture/check_out.dart';
import 'package:capstone_project_tripease/features_profile/profile/view/agungs_fiture/reviews.dart';
import 'package:capstone_project_tripease/features_profile/profile/view/change_password/change_password_screen.dart';
import 'package:capstone_project_tripease/features_profile/profile/view/component/button_active.dart';
import 'package:capstone_project_tripease/features_profile/profile/view/component/custom_dialog.dart';
import 'package:capstone_project_tripease/features_profile/profile/view/component/menu_profile.dart';
import 'package:capstone_project_tripease/features_profile/profile/view/edit_profile/edit_profile_screen.dart';
import 'package:capstone_project_tripease/features_profile/profile/view/help_center/help_center_screen.dart';
import 'package:capstone_project_tripease/features_profile/profile/view/language/language_screen.dart';
import 'package:capstone_project_tripease/features_profile/profile/view/radio_btmsht.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(240, 240, 248, 1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
          child: ListView(
            children: [
              Text(
                'Profile',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              Container(
                height: 84.h,
                margin: EdgeInsets.only(bottom: 20.h, top: 10.h),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 128, 255, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.r),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 29.r,
                          backgroundImage:
                              const AssetImage('assets/images/user.jfif'),
                        ),
                      ),
                      Container(
                        width: 170.h,
                        margin: EdgeInsets.only(left: 14.h, right: 26.h),
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
                            SizedBox(height: 3.h),
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
                        width: 40.h,
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 224.w,
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 20.w),
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
              const Text(
                'Lainnya',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Container(
                width: double.maxFinite,
                height: 152,
                color: Colors.white,
                margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
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
              const Text(
                'Fitur Agung',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              ButtonActive(
                text: 'Go to Check-In',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CheckIn(
                      title: 'Shibuya Shabu',
                    ),
                  ));
                },
              ),
              const SizedBox(height: 10),
              ButtonActive(
                text: 'Go to Check-Out',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CheckOut(
                      title: 'Shibuya Shabu',
                    ),
                  ));
                },
              ),
              const SizedBox(height: 10),
              ButtonActive(
                text: 'Go to Reviews',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Reviews(
                      title: 'Shibuya Shabu',
                    ),
                  ));
                },
              ),
              const SizedBox(height: 10),
              ButtonActive(
                text: 'Go to Bottom sheet radio',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RadioBottomSheet(),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
