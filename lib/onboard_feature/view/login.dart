import 'package:shared_preferences/shared_preferences.dart';

import '/onboard_feature/view/home.dart';
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
                height: 200,
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
                    height: 524,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Masuk',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(0, 128, 255, 1),
                            letterSpacing: 0.15,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                  validator: (email) {
                                    if (email == null &&
                                        !EmailValidator.validate(email!)) {
                                      return 'Please enter valid Email';
                                    }
                                    return null;
                                  },
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.0, right: 8.0, bottom: 5.0),
                                      child: Icon(Icons.person_outline),
                                    ),
                                    prefixIconConstraints: BoxConstraints(
                                        minHeight: 8, minWidth: 8),
                                    suffixIcon: Icon(
                                        Icons.check_circle_outline_outlined),
                                    hintText: 'Masukkan Email',
                                    hintStyle: TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromRGBO(139, 146, 156, 1)),
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
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    prefixIcon: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.0, right: 8.0, bottom: 5.0),
                                      child: Icon(Icons.lock_outline),
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
                                      color: Color.fromRGBO(139, 146, 156, 1),
                                    ),
                                  ),
                                )
                              ],
                            )),
                        const SizedBox(height: 12),
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
                        const SizedBox(height: 6),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forget Password ?',
                            )),
                        const SizedBox(
                          height: 6,
                        ),
                        GestureDetector(
                          onTap: () async {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute<void>(
                            //     builder: (BuildContext context) =>
                            //         const HomePage(),
                            //   ),
                            // );
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setBool('isLogin', true);
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            if (_formKey.currentState!.validate()) {
                              await value.login(email, password);
                              if (context.mounted) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
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
                                'Masuk',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    letterSpacing: 0.0125),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Tidak memiliki Akun?',
                              style: TextStyle(
                                fontSize: 12,
                                letterSpacing: 0.0125,
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
                              child: const Text(
                                'Daftar sekarang',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(0, 128, 255, 1),
                                  letterSpacing: 0.0125,
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
