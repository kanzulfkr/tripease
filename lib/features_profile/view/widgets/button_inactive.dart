import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonInactive extends StatelessWidget {
  const ButtonInactive({
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
        color: const Color.fromRGBO(240, 240, 248, 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.openSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(139, 146, 156, 1),
            ),
          ),
        ),
        onTap: () => onTap(),
      ),
    );
  }
}
