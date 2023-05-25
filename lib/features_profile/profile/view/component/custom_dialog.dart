import 'package:capstone_project_tripease/features_profile/profile/view/component/button_active.dart';
import 'package:capstone_project_tripease/features_profile/profile/view/component/button_inactive.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.btnActive,
    required this.btnInactive,
    required this.onTapActive,
  });
  final String title;
  final String content;
  final String btnActive;
  final String btnInactive;
  final VoidCallback onTapActive;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      titleTextStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              content,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            ButtonActive(
              text: btnActive,
              onTap: () {
                onTapActive();
              },
            ),
            const SizedBox(height: 12),
            ButtonInactive(
              text: btnInactive,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      actions: null,
    );
  }
}
