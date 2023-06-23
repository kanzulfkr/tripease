import 'dart:async';

import '/features_profile/view/widgets/button_active.dart';
import '/features_profile/view/widgets/button_inactive.dart';
import '/features_profile/view/change_password/success.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  int start = 59;
  bool isActive = false;
  bool textIsActive = false;

  @override
  void initState() {
    // startCountDown();
    super.initState();
  }

  void startCountDown() {
    const onSec = Duration(seconds: 1);
    Timer.periodic(onSec, (timer) {
      if (start == 0) {
        setState(() {
          textIsActive = !textIsActive;
          timer.cancel();
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 128, 255, 1),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 70.h, bottom: 20.h),
                child: SvgPicture.asset('assets/svg/undraw_mail_sent.svg'),
              ),
              Text(
                'Email Verifikasi',
                style: GoogleFonts.openSans(
                    fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: EdgeInsets.only(top: 7.h, bottom: 48.h),
                child: Text(
                  'Masukkan kode OTP yang dikirimkan ke email anda ',
                  style: GoogleFonts.openSans(
                      fontSize: 12.sp, fontWeight: FontWeight.w400),
                ),
              ),
              OTPTextField(
                length: 4,
                width: 250.w,
                fieldWidth: 47.w,
                style: GoogleFonts.openSans(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
                textFieldAlignment: MainAxisAlignment.spaceEvenly,
                fieldStyle: FieldStyle.underline,
                otpFieldStyle: OtpFieldStyle(
                  focusBorderColor: const Color.fromRGBO(225, 228, 234, 1),
                  disabledBorderColor: const Color.fromRGBO(225, 228, 234, 1),
                  backgroundColor: const Color.fromRGBO(225, 228, 234, 1),
                  enabledBorderColor: const Color.fromRGBO(225, 228, 234, 1),
                ),
                inputFormatter: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onCompleted: (value) {
                  final isActive = value.contains('1111');
                  setState(() => this.isActive = isActive);
                },
                onChanged: null,
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.h, bottom: 7.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Akan kadaluarsa pada ',
                      style: GoogleFonts.openSans(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '00:$start',
                      style: GoogleFonts.openSans(
                          fontSize: 14.sp, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 64.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tidak menerima kode OTP?',
                      style: GoogleFonts.openSans(
                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                    ),
                    textIsActive
                        ? Text(
                            ' Kirim Ulang',
                            style: GoogleFonts.openSans(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey
                                // color: Color.fromRGBO(0, 128, 255, 1),
                                ),
                          )
                        : InkWell(
                            onTap: () {
                              setState(() {
                                textIsActive = !textIsActive;
                                startCountDown();
                              });
                            },
                            child: Text(
                              ' Kirim Ulang',
                              style: GoogleFonts.openSans(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(0, 128, 255, 1),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              isActive
                  ? ButtonActive(
                      text: 'Verifikasi',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Success(),
                        ));
                      },
                    )
                  : ButtonInactive(
                      text: 'Verifikasi',
                      onTap: () {},
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
