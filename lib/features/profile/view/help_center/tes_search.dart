import 'package:flutter/material.dart';

class TesSearch extends StatefulWidget {
  const TesSearch({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<TesSearch> createState() => _TesSearchState();
}

class _TesSearchState extends State<TesSearch> {
  bool isSearch = false;
  bool isContains = false;

  List popularKeyWords = [
    'konfirmasi pesanan',
    'kirim ulang e-tiket',
    'Pembatalan tiket kereta',
    'koreksi nama penumpang',
    'status pembayaran',
    'cara pesan',
    'konfirmasi pembayaran',
  ];

  List<Map<String, dynamic>> allTopics = [
    {
      "id": 1,
      "title": "Konfirmasi Pesanan dari penyedia atau Pengemudi",
      "tag":
          "Kereta + Hotel / info Paket Kereta + Hotel / Pemesanan Kereta + Hotel",
    },
    {
      "id": 2,
      "title": "Konfirmasi Pesanan dan Bukti Pembayaran",
      "tag":
          "Kereta + Hotel / info Paket Kereta + Hotel / Pemesanan Kereta + Hotel",
    },
    {
      "id": 3,
      "title": "Konfirmasi Pesanan dari tiket Kereta Api",
      "tag":
          "Kereta + Hotel / info Paket Kereta + Hotel / Pemesanan Kereta + Hotel",
    },
    {
      "id": 4,
      "title": "Konfirmasi Pesanan dari Booking Hotel",
      "tag":
          "Kereta + Hotel / info Paket Kereta + Hotel / Pemesanan Kereta + Hotel",
    },
    {
      "id": 5,
      "title": "Konfirmasi Chech In dan Check Out Hotel",
      "tag":
          "Kereta + Hotel / info Paket Kereta + Hotel / Pemesanan Kereta + Hotel",
    },
  ];

  List<Map<String, dynamic>> foundTopics = [];

  @override
  void initState() {
    allTopics = foundTopics;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 128, 255, 1),
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            height: isSearch ? 90 : 130,
            padding: const EdgeInsets.all(20),
            color: isSearch
                ? const Color.fromRGBO(0, 128, 255, 1)
                : const Color.fromRGBO(0, 82, 184, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isSearch
                    ? const SizedBox()
                    : const Center(
                        child: Text(
                          'Cari jawaban Anda di sini',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsets.only(right: 16, top: 10, bottom: 10),
                    hintText: 'Ketuk untuk cari',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(150, 152, 156, 1),
                    ),
                    prefix: const SizedBox(width: 12),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color.fromRGBO(150, 152, 156, 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 600,
          //   child: ListView.builder(
          //     itemCount: 5,
          //     itemBuilder: (context, index) {
          //       return InkWell(
          //         onTap: () {
          //           Navigator.of(context).push(MaterialPageRoute(
          //             builder: (context) => const DetailTopic(
          //               title: 'Details Topic',
          //             ),
          //           ));
          //         },
          //         child: Padding(
          //           padding: const EdgeInsets.only(top: 12),
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: [
          //               Container(
          //                 padding: const EdgeInsets.symmetric(horizontal: 20),
          //                 child: const Text(
          //                   'Ketentuan Refund dan Reschedule Kereta Api selama periode',
          //                   style: TextStyle(
          //                     fontSize: 14,
          //                     fontWeight: FontWeight.w600,
          //                     color: Color.fromRGBO(0, 128, 255, 1),
          //                     letterSpacing: 0.25,
          //                   ),
          //                   maxLines: 2,
          //                 ),
          //               ),
          //               Container(
          //                 margin: const EdgeInsets.only(top: 7, bottom: 10),
          //                 padding: const EdgeInsets.symmetric(horizontal: 20),
          //                 child: const Text(
          //                   'Kereta + Hotel / info Paket Kereta + Hotel / Pemesanan Kereta + Hotel',
          //                   style: TextStyle(
          //                     fontSize: 12,
          //                     fontWeight: FontWeight.w400,
          //                     letterSpacing: 0.4,
          //                   ),
          //                   maxLines: 2,
          //                 ),
          //               ),
          //               const Divider(
          //                 color: Colors.black54,
          //                 height: 3,
          //                 thickness: 1,
          //               ),
          //             ],
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
          // Container(
          //   height: MediaQuery.of(context).size.height - 220,
          //   // height: MediaQuery.of(context).size.height,
          //   color: const Color.fromRGBO(240, 240, 248, 1),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       const Padding(
          //         padding: EdgeInsets.all(20),
          //         child: Text(
          //           'Kata Kunci Populer',
          //           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          //         ),
          //       ),
          //       Container(
          //         color: Colors.white,
          //         height: 250,
          //         width: double.maxFinite,
          //         padding: const EdgeInsets.symmetric(horizontal: 20),
          //         child: Center(
          //           child: Wrap(
          //             children: popularKeyWords.map((keyWords) {
          //               return Container(
          //                 padding: const EdgeInsets.all(10),
          //                 margin: const EdgeInsets.only(
          //                     top: 7, bottom: 7, right: 10),
          //                 decoration: BoxDecoration(
          //                   color: const Color.fromRGBO(240, 240, 248, 1),
          //                   borderRadius: BorderRadius.circular(5),
          //                 ),
          //                 height: 40,
          //                 child: Text(
          //                   keyWords,
          //                   style: const TextStyle(
          //                     fontSize: 14,
          //                     fontWeight: FontWeight.w600,
          //                     color: Color.fromRGBO(0, 128, 255, 1),
          //                     letterSpacing: 0.0125,
          //                   ),
          //                 ),
          //               );
          //             }).toList(),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
