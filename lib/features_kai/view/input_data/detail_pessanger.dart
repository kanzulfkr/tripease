import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../select_seat/select_seat_kai.dart';

class BodyDetailPessanger extends StatelessWidget {
  const BodyDetailPessanger({
    super.key,
    required this.list,
  });

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(4, (index) {
        int passengerNumber = index + 1;
        return Column(
          children: [
            Container(
              height: 280,
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 0, top: 0),
              decoration: BoxDecoration(
                color: const Color(0xF9FAFBFB),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.2,
                    blurRadius: 0.5,
                    offset: const Offset(0.5, 0.5),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Penumpang $passengerNumber', // Label penumpang
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectSeatKai()),
                            );
                          },
                          child: Text(
                            'No.Kursi',
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                              decorationThickness: 2.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 48,
                      width: double.maxFinite,
                      padding: const EdgeInsets.only(left: 20, right: 30),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: DropdownButton<String>(
                        hint: const Text(
                          'Tn. / Ny.',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w600),
                        ),
                        value: null,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        isExpanded: true,
                        underline: const SizedBox(),
                        onChanged: (String? value) {},
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Nomor Identitas',
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'NIK/Paspor',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Nama Lengkap',
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nama Lengkap',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
