import '/features_profile/view/widgets/button_active.dart';
import '/features_profile/view/widgets/button_inactive.dart';
import '/features_profile/view/change_password/email_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool _isVisible = false;
  bool _isNewVisible = false;
  bool isActive = false;
  late TextEditingController _newPassword;
  @override
  void initState() {
    super.initState();
    _newPassword = TextEditingController();
    _newPassword.addListener(() {
      final isActive = _newPassword.text.isNotEmpty;
      setState(() => this.isActive = isActive);
    });
  }

  @override
  void dispose() {
    _newPassword.dispose();
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kata Sandi baru anda harus berbeda dari Kata Sandi yang digunakan sebelumnya.',
              style: GoogleFonts.openSans(
                  fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, bottom: 12.h),
              child: Text(
                'Kata Sandi Baru',
                style: GoogleFonts.openSans(
                    fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ),
            TextFormField(
              controller: _newPassword,
              obscureText: !_isVisible,
              decoration: InputDecoration(
                prefix: SizedBox(width: 12.w),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                hintText: 'Masukkan kata sandi baru',
                hintStyle: GoogleFonts.openSans(
                  fontSize: 14.sp,
                  color: const Color.fromRGBO(150, 152, 156, 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.w,
                    color: const Color.fromRGBO(210, 215, 224, 1),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.w,
                    color: const Color.fromRGBO(210, 215, 224, 1),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, bottom: 12.h),
              child: Text(
                'Konfirmasi Kata Sandi Baru',
                style: GoogleFonts.openSans(
                    fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ),
            TextFormField(
              controller: null,
              obscureText: !_isNewVisible,
              decoration: InputDecoration(
                prefix: SizedBox(width: 12.w),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isNewVisible = !_isNewVisible;
                    });
                  },
                  child: SizedBox(
                    width: 60.w,
                    child: Icon(
                      _isNewVisible ? Icons.visibility : Icons.visibility_off,
                      color: const Color.fromRGBO(150, 152, 156, 1),
                    ),
                  ),
                ),
                hintText: 'Masukkan ulang kata sandi baru',
                hintStyle: GoogleFonts.openSans(
                  fontSize: 14.sp,
                  color: const Color.fromRGBO(150, 152, 156, 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.w,
                    color: const Color.fromRGBO(210, 215, 224, 1),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.w,
                    color: const Color.fromRGBO(210, 215, 224, 1),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 75.h),
            isActive
                ? ButtonActive(
                    text: 'Selanjutnya',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EmailVerification(),
                      ));
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
