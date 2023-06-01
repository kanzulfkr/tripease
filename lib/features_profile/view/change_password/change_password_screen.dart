// ignore_for_file: avoid_print

import 'package:capstone_project_tripease/features_profile/view/widgets/button_active.dart';
import 'package:capstone_project_tripease/features_profile/view/widgets/button_inactive.dart';
import 'package:capstone_project_tripease/features_profile/view_model/user_profile_provider.dart';
import 'package:capstone_project_tripease/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  bool _isVisibleOld = false;
  bool _isVisibleNew = false;
  bool _isVisibleConfirm = false;

  bool isActive = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    Future.microtask(
        () => Provider.of<UserProfileProvider>(context, listen: false));
    super.initState();
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
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
      body: Form(
        key: _formKey,
        onChanged: () {
          if (_formKey.currentState!.validate()) {
            setState(() {
              isActive = true;
            });
          } else if (!_formKey.currentState!.validate()) {
            setState(() {
              isActive = false;
            });
          }
        },
        child: Consumer<UserProfileProvider>(
          builder: (context, value, child) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Masukkan Kata Sandi lama untuk memverifikasi bahwa ini benar-benar anda. Kata Sandi baru harus berbeda dari Kata Sandi yang digunakan sebelumnya.',
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kata Sandi lama tidak boleh kosong';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: oldPasswordController,
                  obscureText: !_isVisibleOld,
                  decoration: InputDecoration(
                    prefix: SizedBox(width: 12.w),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isVisibleOld = !_isVisibleOld;
                        });
                      },
                      child: SizedBox(
                        width: 60.w,
                        child: Icon(
                          _isVisibleOld
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color.fromRGBO(150, 152, 156, 1),
                        ),
                      ),
                    ),
                    hintText: 'Masukkan kata sandi lama',
                    hintStyle: GoogleFonts.openSans(
                      fontSize: 14.sp,
                      color: const Color.fromRGBO(150, 152, 156, 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                      borderRadius: BorderRadius.circular(8.r),
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
                Padding(
                  padding: EdgeInsets.only(top: 30.h, bottom: 12.h),
                  child: Text(
                    'Kata Sandi Baru',
                    style: GoogleFonts.openSans(
                        fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kata Sandi baru tidak boleh kosong';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: newPasswordController,
                  obscureText: !_isVisibleNew,
                  decoration: InputDecoration(
                    prefix: SizedBox(width: 12.w),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isVisibleNew = !_isVisibleNew;
                        });
                      },
                      child: SizedBox(
                        width: 60.w,
                        child: Icon(
                          _isVisibleNew
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color.fromRGBO(150, 152, 156, 1),
                        ),
                      ),
                    ),
                    hintText: 'Masukkan kata sandi baru',
                    hintStyle: GoogleFonts.openSans(
                      fontSize: 14.sp,
                      color: const Color.fromRGBO(150, 152, 156, 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                      borderRadius: BorderRadius.circular(8.r),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kata Sandi baru tidak boleh kosong';
                    } else if (value != newPasswordController.text) {
                      return 'Kata Sandi baru tidak cocok';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: confirmPasswordController,
                  obscureText: !_isVisibleConfirm,
                  decoration: InputDecoration(
                    prefix: SizedBox(width: 12.w),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isVisibleConfirm = !_isVisibleConfirm;
                        });
                      },
                      child: SizedBox(
                        width: 60.w,
                        child: Icon(
                          _isVisibleConfirm
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color.fromRGBO(150, 152, 156, 1),
                        ),
                      ),
                    ),
                    hintText: 'Masukkan ulang kata sandi baru',
                    hintStyle: GoogleFonts.openSans(
                      fontSize: 14.sp,
                      color: const Color.fromRGBO(150, 152, 156, 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                      borderRadius: BorderRadius.circular(8.r),
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
                SizedBox(height: 50.h),
                isActive
                    ? ButtonActive(
                        text: 'Selanjutnya',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            value.updateUserPassword(
                              oldPasswordController.text,
                              newPasswordController.text,
                              confirmPasswordController.text,
                            );
                            if (value.statusCode == '400') {
                              print('400 erorr');
                            } else {
                              if (context.mounted) {
                                print('200 ok');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Center(
                                        child: Text(
                                            'Kata sandi berhasil diperbarui.')),
                                  ),
                                );
                                Navigator.of(context)
                                    .push(MaterialPageRoute(
                                      builder: (context) => const MainPage(),
                                    ))
                                    .then((value) {});
                              }
                            }
                          }
                        },
                      )
                    : ButtonInactive(
                        text: 'Selanjutnya',
                        onTap: () {},
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
