import '/onboard_feature/view/login.dart';
import '/onboard_feature/view_model/register_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/register_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
        () => Provider.of<RegisterProvider>(context, listen: false));
  }

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
      builder: (context, registerProvider, child) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: SafeArea(
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
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Daftar',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(0, 128, 255, 1),
                                letterSpacing: 0.15,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nama Lengkap',
                                      style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 12),
                                    TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: _nameController,
                                      validator: (name) {
                                        if (name == null || name.isEmpty) {
                                          return 'Nama tidak boleh kosong';
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                              bottom: 5.0),
                                          child: Icon(Icons.person),
                                        ),
                                        prefixIconConstraints: BoxConstraints(
                                            minHeight: 8, minWidth: 8),
                                        hintText: 'Budi Sanjaya',
                                        hintStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(
                                                139, 146, 156, 1)),
                                        helperStyle: TextStyle(
                                          fontSize: 10,
                                          color: Color.fromRGBO(0, 128, 255, 1),
                                          letterSpacing: 0.15,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      'Email',
                                      style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 12),
                                    TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: _emailController,
                                      validator: (email) {
                                        if (email == null || email.isEmpty) {
                                          return 'Email tidak boleh kosong';
                                        } else if (!EmailValidator.validate(
                                            email)) {
                                          return 'Format Email tidak valid';
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                              bottom: 5.0),
                                          child: Icon(Icons.person),
                                        ),
                                        prefixIconConstraints: BoxConstraints(
                                            minHeight: 8, minWidth: 8),
                                        hintText: 'yourname@email.com',
                                        hintStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(
                                                139, 146, 156, 1)),
                                        helperStyle: TextStyle(
                                          fontSize: 10,
                                          color: Color.fromRGBO(0, 128, 255, 1),
                                          letterSpacing: 0.15,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      'Nomor Telepon',
                                      style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 12),
                                    TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: _phoneController,
                                      validator: (phone) {
                                        if (phone == null || phone.isEmpty) {
                                          return 'Nomor Telepon tidak boleh kosong';
                                        } else if (phone.length < 10) {
                                          return 'Nomor Telepon tidak valid';
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                              bottom: 5.0),
                                          child: Icon(
                                              Icons.phone_android_outlined),
                                        ),
                                        prefixIconConstraints: BoxConstraints(
                                            minHeight: 8, minWidth: 8),
                                        hintText: '+6212345678',
                                        hintStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(
                                                139, 146, 156, 1)),
                                        helperStyle: TextStyle(
                                          fontSize: 10,
                                          color: Color.fromRGBO(0, 128, 255, 1),
                                          letterSpacing: 0.15,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      'Kata Sandi',
                                      style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 12),
                                    TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: _passwordController,
                                      validator: (password) {
                                        if (password == null ||
                                            password.isEmpty) {
                                          return 'Kata Sandi tidak boleh kosong';
                                        } else if (password.length < 8) {
                                          return 'Kata Sandi minimal 8 karakter';
                                        }
                                        return null;
                                      },
                                      obscureText: !_isVisible,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        prefixIcon: const Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                              bottom: 5.0),
                                          child: Icon(Icons.lock),
                                        ),
                                        prefixIconConstraints:
                                            const BoxConstraints(minHeight: 0),
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
                                        hintStyle: const TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromRGBO(139, 146, 156, 1),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      'Konfirmasi Kata Sandi',
                                      style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 12),
                                    TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: _confirmPasswordController,
                                      validator: (password) {
                                        if (password == null ||
                                            password.isEmpty) {
                                          return 'Kata Sandi tidak boleh kosong';
                                        } else if (password.length < 8) {
                                          return 'Kata Sandi minimal 8 karakter';
                                        } else if (password !=
                                            _passwordController.text) {
                                          return 'Kata Sandi tidak sama';
                                        }
                                        return null;
                                      },
                                      obscureText: !_isVisible,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        prefixIcon: const Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                              bottom: 5.0),
                                          child: Icon(Icons.lock),
                                        ),
                                        prefixIconConstraints:
                                            const BoxConstraints(minHeight: 0),
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
                                        hintText: 'Masukkan Ulang Kata Sandi',
                                        hintStyle: const TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromRGBO(139, 146, 156, 1),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                  ],
                                )),
                            const Row(
                              children: [
                                Icon(Icons.lock_outline),
                                SizedBox(width: 5),
                                Text(
                                  'Kami akan melindungi data anda.',
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                            const SizedBox(height: 12),
                            GestureDetector(
                              onTap: () async {
                                String email = _emailController.text;
                                String name = _nameController.text;
                                String phone = _phoneController.text;
                                String password = _passwordController.text;
                                String confirmPassword =
                                    _confirmPasswordController.text;

                                if (_formKey.currentState!.validate()) {
                                  registerProvider
                                      .setConfirmPassword(confirmPassword);
                                  registerProvider.setEmail(email);
                                  registerProvider.setFullName(name);
                                  registerProvider.setPassword(password);
                                  registerProvider.setPhoneNumber(phone);

                                  debugPrint('Email: ${registerProvider.email}'
                                      '\nFull Name: ${registerProvider.fullName}'
                                      '\nPhone Number: ${registerProvider.phoneNumber}'
                                      '\nPassword: ${registerProvider.password}'
                                      '\nConfirm Password: ${registerProvider.confirmPassword}');

                                  UserRegisterResponseModel userRegister =
                                      UserRegisterResponseModel(
                                    email: registerProvider.email,
                                    fullName: registerProvider.fullName,
                                    phoneNumber: registerProvider.phoneNumber,
                                    password: registerProvider.password,
                                    confirmPassword:
                                        registerProvider.confirmPassword,
                                  );
                                  await registerProvider.register(userRegister);
                                  const snackBar = SnackBar(
                                    content: Text('Berhasil disimpan'),
                                    backgroundColor: Color(0xff0080FF),
                                  );
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);

                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage()));
                                  }
                                }
                              },
                              child: Container(
                                height: 40,
                                width: double.maxFinite,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(0, 128, 255, 1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Daftar',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        letterSpacing: 0.0125),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 26),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Sudah memiliki Akun?',
                                  style: TextStyle(
                                    fontSize: 12,
                                    letterSpacing: 0.0125,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            const LoginPage(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Masuk sekarang',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(0, 128, 255, 1),
                                      letterSpacing: 0.0125,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
