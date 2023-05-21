import 'package:capstone_project_tripease/features/profile/view/component/button_active.dart';
import 'package:capstone_project_tripease/features/profile/view/component/button_inactive.dart';
import 'package:capstone_project_tripease/features/profile/view/change_password/email_verification.dart';
import 'package:flutter/material.dart';

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
              'Kata Sandi baru anda harus berbeda dari Kata Sandi yang digunakan sebelumnya.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 12),
              child: Text(
                'Kata Sandi Baru',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            TextFormField(
              controller: _newPassword,
              obscureText: !_isVisible,
              decoration: InputDecoration(
                prefix: const SizedBox(width: 12),
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
                hintText: 'Masukkan kata sandi baru',
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
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 12),
              child: Text(
                'Konfirmasi Kata Sandi Baru',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            TextFormField(
              controller: null,
              obscureText: !_isVisible,
              decoration: InputDecoration(
                prefix: const SizedBox(width: 12),
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
                hintText: 'Masukkan ulang kata sandi baru',
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
