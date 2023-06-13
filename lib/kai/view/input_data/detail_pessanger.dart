import 'package:capstone_project_tripease/kai/view/select_seat/select_seat_kai.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyDetailPessanger extends StatefulWidget {
  const BodyDetailPessanger({
    Key? key,
    required this.list,
    required this.passengerNumber,
    required this.jenisKA,
  }) : super(key: key);

  final List<String> list;
  final int passengerNumber;
  final String jenisKA;

  @override
  State<BodyDetailPessanger> createState() => _BodyDetailPessangerState();
}

class _BodyDetailPessangerState extends State<BodyDetailPessanger> {
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
                            print('${widget.jenisKA}');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SelectSeatKai(
                                          passengerNumber: passengerNumber,
                                          jenisKA: widget.jenisKA,
                                        )));
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
                        items: widget.list
                            .map<DropdownMenuItem<String>>((String value) {
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
