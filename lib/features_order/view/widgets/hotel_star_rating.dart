import 'package:flutter/material.dart';

class HotelStarRating extends StatelessWidget {
  final int bintang;

  const HotelStarRating(this.bintang, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        bintang,
        (index) => const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      ),
    );
  }
}
