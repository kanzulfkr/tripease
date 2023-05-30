import 'package:capstone_project_tripease/kai/view/departure_schedule/appbar_departure.dart';
import 'package:capstone_project_tripease/kai/view/departure_schedule/list_departure.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DepartureSchedule extends StatefulWidget {
  const DepartureSchedule({super.key});

  @override
  State<DepartureSchedule> createState() => _DepartureScheduleState();
}

class _DepartureScheduleState extends State<DepartureSchedule> {
  bool isDropdownOpened = false;
  bool val = false;
  List<String> list = <String>[
    'Harga Terendah',
    'Keberangkatan Awal',
    'Keberangkatan Akhir',
    'Kedatangan Awal',
    'Kedatangan Akhir',
    'Durasi Tercepat'
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const BuildAppbar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      _showFilterBottomSheet(context);
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.tune,
                            color: Colors.blueAccent,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Filter',
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 55),
                  const Text('Urut'),
                  SizedBox(width: 18),
                  Container(
                    height: 40,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.r),
                      ),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Pilih',
                            style: GoogleFonts.openSans(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        value: selectedValue,
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                          ),
                          openMenuIcon: Icon(Icons.arrow_drop_up),
                        ),
                        isExpanded: true,
                        underline: const SizedBox(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Container(
                width: double.maxFinite,
                height: 92,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(210, 215, 224, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 35,
                          child: Text('Filter'),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          height: 32,
                          width: 255,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                height: 32,
                                // width: 135,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(102, 178, 255, 1),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '00.00 - 06.00 (B)',
                                    style: GoogleFonts.openSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Container(
                                height: 32,
                                // width: 135,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(102, 178, 255, 1),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '00.00 - 06.00 (B)',
                                    style: GoogleFonts.openSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.close,
                          size: 20,
                          color: Color.fromRGBO(150, 152, 156, 1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(
                          width: 35,
                          child: Text('Urut'),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          height: 32,
                          width: 255,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                height: 32,
                                // width: 135,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(102, 178, 255, 1),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Jam Keberangkatan',
                                    style: GoogleFonts.openSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.close,
                          size: 20,
                          color: Color.fromRGBO(150, 152, 156, 1),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Column(
                    children: _if,
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 80,
                    height: 68,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Pulang Pergi?',
                          style: GoogleFonts.openSans(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        CupertinoSwitch(
                          activeColor: Colors.blueAccent,
                          trackColor: Colors.grey,
                          value: val,
                          onChanged: (newValue) {
                            setState(() {
                              val = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 20,
                thickness: 1,
                color: Color.fromRGBO(113, 114, 117, 1),
              ),
              const SizedBox(
                height: 400,
                width: double.maxFinite,
                child: ListDeparture(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> get _if {
    return [
      Container(
        width: 232,
        height: 68,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Container(
          height: 44,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(color: Colors.grey),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tanggal Keberangkatan',
                      style: GoogleFonts.openSans(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '05 April 2023',
                      style: GoogleFonts.openSans(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 50,
                  child: Icon(
                    Icons.calendar_month,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      if (val)
        Container(
          width: 232,
          height: 68,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Container(
            height: 44,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(color: Colors.grey),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tanggal Kembali',
                        style: GoogleFonts.openSans(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '05 April 2023',
                        style: GoogleFonts.openSans(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                    child: Icon(
                      Icons.calendar_month,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
    ];
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 479,
          width: 360,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: 43,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 43),
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xF9FAFBFB),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jenis Kereta Api',
                      style: GoogleFonts.openSans(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 32,
                          width: 83,
                          margin: EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            border: Border.all(
                                color: const Color(
                                    0xFFE1E4EA)), // Tambahkan warna pinggiran di sini
                          ),
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: Text(
                            'Ekonomi',
                            style: GoogleFonts.openSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFE1E4EA)),
                          ),
                        ),
                        const SizedBox(
                          width: 42,
                        ),
                        Container(
                          height: 32,
                          width: 83,
                          margin: const EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            border: Border.all(
                                color: const Color(
                                    0xFFE1E4EA)), // Tambahkan warna pinggiran di sini
                          ),
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: Text(
                            'Bisnis',
                            style: GoogleFonts.openSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFE1E4EA)),
                          ),
                        ),
                        const SizedBox(
                          width: 42,
                        ),
                        Container(
                          height: 32,
                          width: 83,
                          margin: const EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            border: Border.all(
                                color: const Color(
                                    0xFFE1E4EA)), // Tambahkan warna pinggiran di sini
                          ),
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: Text(
                            'Eksekutif',
                            style: GoogleFonts.openSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFE1E4EA)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Nama Kereta Api',
                      style: GoogleFonts.openSans(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFFE1E4EA)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: DropdownButton2<String>(
                          hint: Text(
                            'Pilih Nama Kereta Api',
                            style: GoogleFonts.openSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFE1E4EA),
                            ),
                          ),

                          value: null,
                          // icon: const Icon(Icons.arrow_drop_down),
                          // elevation: 16,
                          isExpanded: true,
                          underline: Container(
                            height: 0,
                            color: Colors.transparent,
                          ),
                          // dropdownColor:
                          //     Colors.grey[300], // Warna pinggiran dropdown
                          onChanged: (String? value) {},
                          items: list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Aksi yang ingin dilakukan saat tombol ditekan
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(252, 40), // Ukuran tombol
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  5), // Sudut melengkung dengan jari-jari 5
                            ),
                            padding: const EdgeInsets.fromLTRB(
                                24, 0, 24, 0), // Padding di kiri dan kanan
                            primary: const Color(
                                0XFF0080FF) // Warna latar belakang biru
                            ),
                        child: Text(
                          'Terapkan',
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white, // Warna teks putih
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
