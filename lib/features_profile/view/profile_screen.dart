import '/features_profile/view/change_password/change_password_screen.dart';
import '/features_profile/view/widgets/custom_dialog.dart';
import '/features_profile/view/widgets/menu_profile.dart';
import '/features_profile/view/edit_profile/edit_profile_screen.dart';
import '/features_profile/view/help_center/help_screen.dart';
import '/features_profile/view/language/language_screen.dart';
import '/features_profile/view_model/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../features_onboard/utils/token_manager.dart';
import '../../features_onboard/view/login.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserProfileProvider>(context, listen: false);
    user.getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProfileProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(240, 240, 248, 1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                'Profil',
                style: GoogleFonts.openSans(
                    fontSize: 16.sp, fontWeight: FontWeight.w600),
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
                          child: user.loading
                              ? CircleAvatar(
                                  radius: 29.r,
                                  backgroundImage: const AssetImage(
                                      'assets/images/user.jfif'),
                                )
                              : CircleAvatar(
                                  radius: 29.r,
                                  backgroundImage: NetworkImage(
                                    user.result?.profilePictureUrl ?? '',
                                  ),
                                )),
                      Container(
                        width: 170.h,
                        margin: EdgeInsets.only(left: 14.h, right: 26.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.loading
                                  ? 'User name'
                                  : user.result?.fullName ?? '',
                              style: GoogleFonts.openSans(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              user.loading
                                  ? 'me@email.com'
                                  : user.result?.email ?? '',
                              style: GoogleFonts.openSans(
                                  fontSize: 12.sp,
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
                            return LogoutDialog(
                              title: 'Keluar dari akun',
                              content:
                                  'Sayang sekali, banyak keuntungan yang anda lewatkan. Apakah anda yakin untuk keluar?',
                              btnActive: 'Ya',
                              btnInactive: 'Tidak',
                              onTapActive: () {
                                TokenManager.removeToken();
                                LoginManager.removeLogin();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()),
                                    (route) => false);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Text(
                'Lainnya',
                style: GoogleFonts.openSans(
                    fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              Container(
                width: double.maxFinite,
                height: 155.h,
                color: Colors.white,
                margin: EdgeInsets.only(top: 20.h),
                child: Column(
                  children: [
                    MenuProfile(
                      iconName: Icons.question_mark_outlined,
                      name: 'Pusat Bantuan',
                      description: 'Temukan jawaban terbaik Anda',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HelpScreen(
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
            ],
          ),
        ),
      ),
    );
  }
}
