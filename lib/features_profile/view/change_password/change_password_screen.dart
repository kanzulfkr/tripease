import 'package:capstone_project_tripease/features_profile/view/widgets/button_active.dart';
import 'package:capstone_project_tripease/features_profile/view/widgets/button_inactive.dart';
import 'package:capstone_project_tripease/features_profile/view/change_password/new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _isVisible = false;
  bool isActive = false;
  late TextEditingController _oldPassword;

  @override
  void initState() {
    super.initState();
    _oldPassword = TextEditingController();
    _oldPassword.addListener(() {
      final isActive = _oldPassword.text.isNotEmpty;
      setState(() => this.isActive = isActive);
    });
  }

  @override
  void dispose() {
    _oldPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 128, 255, 1),
        title: Text(
          widget.title,
          style: GoogleFonts.openSans(
              fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masukkan Kata Sandi lama untuk memverifikasi bahwa ini benar-benar anda.',
              style: GoogleFonts.openSans(
                  fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, bottom: 12.h),
              child: Text(
                'Kata Sandi Lama',
                style: GoogleFonts.openSans(
                    fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ),
            TextFormField(
              controller: _oldPassword,
              obscureText: !_isVisible,
              decoration: InputDecoration(
                prefix: SizedBox(width: 12.w),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  child: SizedBox(
                    width: 60.w,
                    child: Icon(
                      _isVisible ? Icons.visibility : Icons.visibility_off,
                      color: const Color.fromRGBO(150, 152, 156, 1),
                    ),
                  ),
                ),
                hintText: 'Masukkan kata sandi lama',
                hintStyle: GoogleFonts.openSans(
                  fontSize: 14.sp,
                  color: const Color.fromRGBO(150, 152, 156, 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(height: 75.h),
            isActive
                ? ButtonActive(
                    text: 'Selanjutnya',
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                            builder: (context) => const NewPasswordScreen(
                              title: 'Ubah Kata Sandi',
                            ),
                          ))
                          .then((value) {});
                    },
                  )
                : ButtonInactive(
                    text: 'Selanjutnya',
                    onTap: () {},
                  ),
          ],
        ),
      ),
    );
  }
}
