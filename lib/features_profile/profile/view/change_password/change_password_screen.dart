import 'package:capstone_project_tripease/features_profile/profile/view/component/button_active.dart';
import 'package:capstone_project_tripease/features_profile/profile/view/component/button_inactive.dart';
import 'package:capstone_project_tripease/features_profile/profile/view/change_password/new_password_screen.dart';
import 'package:flutter/material.dart';

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
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Masukkan Kata Sandi lama untuk memverifikasi bahwa ini benar-benar anda.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 12),
              child: Text(
                'Kata Sandi Lama',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            TextFormField(
              controller: _oldPassword,
              obscureText: !_isVisible,
              decoration: InputDecoration(
                prefix: const SizedBox(width: 12),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  child: SizedBox(
                    width: 60,
                    child: Icon(
                      _isVisible ? Icons.visibility : Icons.visibility_off,
                      color: const Color.fromRGBO(150, 152, 156, 1),
                    ),
                  ),
                ),
                hintText: 'Masukkan kata sandi lama',
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(150, 152, 156, 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 75),
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
