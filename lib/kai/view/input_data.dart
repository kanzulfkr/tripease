import 'package:capstone_project_tripease/kai/view/before_select.dart';
import 'package:capstone_project_tripease/kai/view/payment_page.dart';
import 'package:capstone_project_tripease/kai/view/select_seat.dart';
import 'package:capstone_project_tripease/kai/view/select_seat_kai.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InputDataKai extends StatefulWidget {
  const InputDataKai({super.key});

  @override
  State<InputDataKai> createState() => _InputDataKaiState();
}

class _InputDataKaiState extends State<InputDataKai> {
  bool isDropdownPemesan = false;
  bool isDropdownPenumpang = false;
  bool val = false;
  List<String> list = <String>['Tuan', 'Nyonya'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Row(
          children: [
            SizedBox(
              width: 260,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Bandung',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'BD',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Cicalengka',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'CLK',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 350,
                width: double.maxFinite,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      // padding: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.fromLTRB(1, 0, 1, 12),
                      child: Container(
                        height: 160,
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
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
                            const Row(
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
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isDropdownPemesan = !isDropdownPemesan;
                  });
                },
                child: Container(
                  height: 48,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(left: 0, top: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Detail Pemesanan ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        isDropdownPemesan
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                      ),
                    ],
                  ),
                ),
              ),
              if (isDropdownPemesan) ...[
                Container(
                  height: 480,
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
                        Text(
                          'Nama',
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
                              hintText: 'Nama Pemesan',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Nomor Telepon',
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
                              hintText: 'Nomor telepon (diawali 0)',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Email',
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
                              hintText: 'Email Pemesan',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 150,
                          width: double.maxFinite,
                          margin: const EdgeInsets.only(left: 0, top: 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color.fromARGB(255, 219, 215, 215),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0.2,
                                blurRadius: 0.5,
                                offset: const Offset(0.5, 0.5),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, top: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.info_rounded,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      "Info",
                                      style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                LayoutBuilder(
                                  builder: (BuildContext context,
                                      BoxConstraints constraints) {
                                    return const Text(
                                      'Data Pemesan hanya digunakan untuk mengirim invoice melalui email dan segala yang berhubungan dengan transaksi. Privasi data tetap terjaga',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      maxLines:
                                          6, // Jumlah maksimum baris yang ingin ditampilkan
                                      overflow: TextOverflow
                                          .ellipsis, // Tindakan yang diambil saat teks melampaui jumlah maksimum baris
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
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
                              'Tambahkan sebagai Penumpang',
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white, // Warna teks putih
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              const SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isDropdownPenumpang = !isDropdownPenumpang;
                  });
                },
                child: Container(
                  height: 48,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(left: 0, top: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Detail Penumpang ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        isDropdownPenumpang
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                      ),
                    ],
                  ),
                ),
              ),
              if (isDropdownPenumpang) ...[
                Column(
                  children: List.generate(4, (index) {
                    int passengerNumber = index + 1; // Nomor penumpang
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
                                  children: [
                                    Text(
                                      'Penumpang $passengerNumber', // Label penumpang
                                      style: GoogleFonts.openSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 175),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BeforeSelect()),
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
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 30),
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
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    value: null,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    elevation: 16,
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    onChanged: (String? value) {},
                                    items: list.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
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
                ),
              ],
              const SizedBox(
                height: 99,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showCustomAlertDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(252, 40), // Ukuran tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            5), // Sudut melengkung dengan jari-jari 5
                      ),
                      padding: const EdgeInsets.fromLTRB(
                          24, 0, 24, 0), // Padding di kiri dan kanan
                      primary:
                          const Color(0XFF0080FF) // Warna latar belakang biru
                      ),
                  child: Text(
                    'Konfirmasi',
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white, // Warna teks putih
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showCustomAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          content: Container(
            height: 101,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Konfirmasi Pesanan',
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                // Tambahkan konten dialog di sini
                Text(
                  'Apakah data yang dimasukkan sudah benar?',
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Tidak',
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Ya',
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentPage()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
