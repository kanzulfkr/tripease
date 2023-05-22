import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SlidePage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const SlidePage(
      {super.key,
      required this.title,
      required this.description,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 130),
      color: Colors.white,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(image),
        const SizedBox(
          height: 60,
        ),
        Text(
          title,
          style: GoogleFonts.openSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xEE262627)),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          description,
          style: GoogleFonts.openSans(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color(0xEE262627)),
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
