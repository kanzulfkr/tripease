import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketBooking extends StatelessWidget {
  const TicketBooking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Container(
            height: 160,
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.2,
                  blurRadius: 0.5,
                  offset: const Offset(0.5, 0.5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/logo_kai.svg',
                      width: 24,
                      height: 21,
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Turangga',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Stasiun Bandung',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Rp 5.000,-',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ekonomi',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(113, 114, 117, 1),
                      ),
                    ),
                    Text(
                      'Tersedia',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(61, 175, 29, 1),
                      ),
                    )
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '04.00',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Icon(Icons.arrow_forward),
                    Text(
                      '04.30',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '05 April 2023',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(113, 114, 117, 1),
                      ),
                    ),
                    Text(
                      '0 j 30 m',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(113, 114, 117, 1),
                      ),
                    ),
                    Text(
                      '05 April 2023',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(113, 114, 117, 1),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 160,
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.2,
                  blurRadius: 0.5,
                  offset: const Offset(0.5, 0.5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/logo_kai.svg',
                      width: 24,
                      height: 21,
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Turangga',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Stasiun Bandung',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Rp 5.000,-',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ekonomi',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(113, 114, 117, 1),
                      ),
                    ),
                    Text(
                      'Tersedia',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(61, 175, 29, 1),
                      ),
                    )
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '04.00',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Icon(Icons.arrow_forward),
                    Text(
                      '04.30',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '05 April 2023',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(113, 114, 117, 1),
                      ),
                    ),
                    Text(
                      '0 j 30 m',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(113, 114, 117, 1),
                      ),
                    ),
                    Text(
                      '05 April 2023',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(113, 114, 117, 1),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
