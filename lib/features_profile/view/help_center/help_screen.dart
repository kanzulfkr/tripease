import 'package:capstone_project_tripease/features_profile/view/help_center/detail_topic.dart';
import 'package:capstone_project_tripease/features_profile/view/help_center/widgets/not_found_keywords.dart';
import 'package:capstone_project_tripease/features_profile/view/help_center/widgets/popular_keywords.dart';
import 'package:capstone_project_tripease/features_profile/view/help_center/widgets/popular_topic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key, required this.title});
  final String title;

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final List<Map<String, dynamic>> allTopics = [
    {
      "id": 1,
      "title": "Konfirmasi Pesanan kereta",
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
      "title": "Checkin Hotel",
      "tag":
          "Kereta + Hotel / info Paket Kereta + Hotel / Pemesanan Kereta + Hotel",
    },
    {
      "id": 5,
      "title": "Checkuut Hotel",
      "tag":
          "Kereta + Hotel / info Paket Kereta + Hotel / Pemesanan Kereta + Hotel",
    },
  ];
  bool isTap = false;
  List<Map<String, dynamic>> foundTopics = [];
  final FocusNode _textFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _textFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  initState() {
    foundTopics = allTopics;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = allTopics;
    } else {
      results = allTopics
          .where((user) => user["title"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      foundTopics = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 128, 255, 1),
        title: Text(
          isTap ? 'Pencarian' : widget.title,
          style: GoogleFonts.openSans(
              fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(double.maxFinite, isTap ? 78.h : 118.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            color: isTap
                ? const Color.fromRGBO(0, 128, 255, 1)
                : const Color.fromRGBO(0, 82, 184, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                isTap
                    ? const SizedBox()
                    : Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: Text(
                            'Cari jawaban Anda di sini',
                            style: GoogleFonts.openSans(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                TextFormField(
                  controller: _searchController,
                  onTap: () {
                    setState(() {
                      isTap = true;
                    });
                  },
                  onChanged: (value) {
                    _runFilter(value);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.only(right: 16, top: 10.h, bottom: 10),
                    hintText: 'Ketuk untuk cari',
                    hintStyle: GoogleFonts.openSans(
                      fontSize: 14.sp,
                      color: const Color.fromRGBO(150, 152, 156, 1),
                    ),
                    prefix: SizedBox(width: 12.w),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color.fromRGBO(150, 152, 156, 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromRGBO(210, 215, 224, 1)),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: isTap
          ? _searchController.text.isNotEmpty
              ? foundTopics.isNotEmpty
                  ? SizedBox(
                      height: 600.h,
                      child: ListView.builder(
                        itemCount: foundTopics.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const DetailTopic(
                                  title: 'Details Topic',
                                ),
                              ));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 12.h),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Text(
                                      foundTopics[index]["title"].toString(),
                                      style: GoogleFonts.openSans(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                            0, 128, 255, 1),
                                        letterSpacing: 0.125,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 7.h, bottom: 10.h),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Text(
                                      foundTopics[index]["tag"].toString(),
                                      style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.125,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.black54,
                                    height: 3.h,
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : const NotFoundKeywords()
              : const PopularKeywords()
          : const PopularTopic(),
    );
  }
}
