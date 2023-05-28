import 'dart:async';

import 'package:capstone_project_tripease/features_profile/view/component/button_active.dart';
import 'package:capstone_project_tripease/features_profile/view/component/button_inactive.dart';
import 'package:capstone_project_tripease/features_profile/view/change_password/success.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, bottom: 20),
                child: SvgPicture.asset('assets/svg/undraw_mail_sent.svg'),
              ),
              const Text(
                'Email Verifikasi',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 7, bottom: 48),
                child: Text(
                  'Masukkan kode OTP yang dikirimkan ke email anda ',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ),
              OTPTextField(
                length: 4,
                width: 250,
                fieldWidth: 47,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                textFieldAlignment: MainAxisAlignment.spaceEvenly,
                fieldStyle: FieldStyle.underline,
                otpFieldStyle: OtpFieldStyle(
                  focusBorderColor: const Color.fromRGBO(225, 228, 234, 1),
                  disabledBorderColor: const Color.fromRGBO(225, 228, 234, 1),
                  backgroundColor: const Color.fromRGBO(225, 228, 234, 1),
                  enabledBorderColor: const Color.fromRGBO(225, 228, 234, 1),
                  // focusBorderColor: Colors.green,
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
                padding: const EdgeInsets.only(top: 24, bottom: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Akan kadaluarsa pada ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '00:$start',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 64),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Tidak menerima kode OTP?',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    textIsActive
                        ? const Text(
                            ' Kirim Ulang',
                            style: TextStyle(
                                fontSize: 14,
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
                            child: const Text(
                              ' Kirim Ulang',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(0, 128, 255, 1),
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
