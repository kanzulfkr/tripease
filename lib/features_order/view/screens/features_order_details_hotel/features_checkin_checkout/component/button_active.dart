import 'package:flutter/material.dart';

class ButtonActive extends StatelessWidget {
  const ButtonActive({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 128, 255, 1),
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
