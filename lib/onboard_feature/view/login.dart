import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main_page.dart';
import '../utils/token_manager.dart';
import '/onboard_feature/view/register.dart';
import '/onboard_feature/view_model/login_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => Provider.of<LoginProvider>(context, listen: false));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, value, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                height: 200.h,
                width: double.maxFinite,
                child: Image.asset(
                  'assets/images/around-the-world.png',
                  scale: 1,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 180),
                  Container(
                    height: 524.h,
                    width: double.infinity,
                    padding: EdgeInsets.all(20.sp),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Masuk',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(0, 128, 255, 1),
                            letterSpacing: 0.15,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: GoogleFonts.openSans(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 12.h),
                                TextFormField(
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  validator: (email) {
                                    if (email == null &&
                                        !EmailValidator.validate(email!)) {
                                      return 'Please enter valid Email';
                                    }
                                    return null;
                                  },
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.r),
                                      ),
                                    ),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.0.sp,
                                          right: 8.0.sp,
                                          bottom: 5.0.sp),
                                      child: const Icon(Icons.person_outline),
                                    ),
                                    prefixIconConstraints: BoxConstraints(
                                        minHeight: 8.h, minWidth: 8.w),
                                    suffixIcon: const Icon(
                                        Icons.check_circle_outline_outlined),
                                    hintText: 'Masukkan Email',
                                    hintStyle: TextStyle(
                                        fontSize: 12.sp,
                                        color: const Color.fromRGBO(
                                            139, 146, 156, 1)),
                                    helperStyle: TextStyle(
                                      fontSize: 10.sp,
                                      color:
                                      const Color.fromRGBO(0, 128, 255, 1),
                                      letterSpacing: 0.15.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  'Kata Sandi',
                                  style: GoogleFonts.openSans(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 12.h),
                                TextFormField(
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Tolong masukkan kata sandi';
                                    } else if (value.length < 6) {
                                      return 'Kata sandi tidak boleh kurang dari 6 karakter';
                                    }

                                    return null;
                                  },
                                  controller: _passwordController,
                                  obscureText: !_isVisible,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5.r),
                                      ),
                                    ),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.0.sp,
                                          right: 8.0.sp,
                                          bottom: 5.0.sp),
                                      child: const Icon(Icons.lock_outline),
                                    ),
                                    prefixIconConstraints:
                                    BoxConstraints(minHeight: 0.h),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isVisible = !_isVisible;
                                        });
                                      },
                                      icon: _isVisible
                                          ? const Icon(
                                        Icons.visibility,
                                        color: Colors.grey,
                                      )
                                          : const Icon(
                                        Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    hintText: 'Masukkan Kata Sandi',
                                    hintStyle: TextStyle(
                                      fontSize: 12.sp,
                                      color: const Color.fromRGBO(
                                          139, 146, 156, 1),
                                    ),
                                  ),
                                )
                              ],
                            )),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            Icon(Icons.lock_outline),
                            SizedBox(width: 5.w),
                            Text(
                              'Kami akan melindungi data anda.',
                              style: TextStyle(fontSize: 10.sp),
                            )
                          ],
                        ),
                        SizedBox(height: 6.h),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forget Password ?',
                            )),
                        SizedBox(
                          height: 6.h,
                        ),
                        GestureDetector(
                          onTap: () async {
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            if (_formKey.currentState!.validate()) {
                              await value.login(email, password);
                              if (value.loginStatus == LoginStatus.loading) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Loading'),
                                    ),
                                  );
                                }
                              } else if (value.loginStatus ==
                                  LoginStatus.success) {
                                if (context.mounted) {
                                  LoginManager.saveLogin(true);
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => const MainPage(),
                                    ),
                                  );
                                }
                              } else if (value.loginStatus ==
                                  LoginStatus.error) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(value.message),
                                    ),
                                  );
                                }
                              }
                            }
                          },
                          child: Container(
                            height: 40.h,
                            width: double.maxFinite.w,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(0, 128, 255, 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.r),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Masuk',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    letterSpacing: 0.0125.sp),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Tidak memiliki Akun?',
                              style: TextStyle(
                                fontSize: 12.sp,
                                letterSpacing: 0.0125.sp,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                    const RegisterPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'Daftar sekarang',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color.fromRGBO(0, 128, 255, 1),
                                  letterSpacing: 0.0125.sp,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
