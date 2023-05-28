import 'package:flutter/material.dart';

class ButtonClose extends StatelessWidget {
  const ButtonClose({
    super.key,
    required this.text,
    // required this.colorText,
    // required this.colorButton,
    required this.onTap,
  });

  final String text;
  // final Color colorText;
  // final Color colorButton;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(197, 41, 32, 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        onTap: () => onTap(),
      ),
    );
  }
}
