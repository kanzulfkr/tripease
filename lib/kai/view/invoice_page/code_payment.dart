import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CodePayment extends StatelessWidget {
  const CodePayment({
    super.key,
    required this.orderNumber,
  });

  final String orderNumber;

  @override
  Widget build(BuildContext context) {
    return Text(
      'No.$orderNumber',
      style: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w600),
    );
  }
}
