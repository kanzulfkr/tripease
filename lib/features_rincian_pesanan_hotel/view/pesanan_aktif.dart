import 'package:capstone_project_tripease/features_pesanan/utils/colors.dart';
import 'package:capstone_project_tripease/features_pesanan/utils/icons.dart';
import 'package:capstone_project_tripease/features_pesanan/utils/images.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../features_checkout_checkin/component/button_active.dart';
import '../../../../features_checkout_checkin/component/button_close.dart';
import '../../../../home.dart';
import '../../features_pesanan/utils/fonts.dart';

class PesananAktif extends StatefulWidget {
  const PesananAktif({super.key});

  @override
  State<PesananAktif> createState() => _PesananAktifState();
}

class _PesananAktifState extends State<PesananAktif> {
  void _showAlertDialog() {
    ScreenUtil.init(context);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Apakah Anda yakin ingin membatalkan pesanan?',
            textAlign: TextAlign.center,
          ),
          titleTextStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 132.w,
                  child: ButtonClose(
                    text: 'Ya',
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  width: 132.w,
                  child: ButtonActive(
                    text: 'Tidak',
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: null,
        );
      },
    );
  }

  late bool _customIcon = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rincian Pesanan',
          style: myTextTheme.headlineLarge,
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Container(
                  width: 350.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: success,
                    borderRadius: BorderRadius.circular(8.0.r),
                    border: Border.all(color: green),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        iconSuccess,
                        SizedBox(width: 10.w),
                        Text(
                          'Pesananmu Sudah Bayar',
                          style: GoogleFonts.openSans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                color: background,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    shibuya,
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(
                              'Shibuya Shabu',
                              style: myTextTheme.displayMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 10,
                            ),
                            child: Text(
                              'Thonglor Soi 20, Bangkok Thailand',
                              style: myTextTheme.headlineSmall,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 10,
                              bottom: 10,
                            ),
                            child: Row(
                              children: [
                                iconStar,
                                SizedBox(width: 5.w),
                                iconStar,
                                SizedBox(width: 5.w),
                                iconStar,
                                SizedBox(width: 5.w),
                                iconStar,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 350.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(8.0.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1.w,
                    blurRadius: 1.w,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    iconMaps,
                    SizedBox(width: 40.w),
                    Text(
                      'Lihat Di Map',
                      style: GoogleFonts.openSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: mainBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1.w,
                      blurRadius: 1.w,
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
                child: Card(
                  color: background,
                  shadowColor: grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0.r),
                  ),
                  margin: EdgeInsets.zero,
                  child: ExpansionTile(
                    leading: iconInfo,
                    title: Text(
                      'Informasi Pesanan',
                      style: GoogleFonts.openSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: mainBlue,
                      ),
                    ),
                    trailing: _customIcon
                        ? const Icon(
                            Icons.expand_less_rounded,
                            color: mainBlue,
                          )
                        : const Icon(
                            Icons.expand_more_rounded,
                            color: mainBlue,
                          ),
                    onExpansionChanged: (bool value) {
                      setState(() {
                        _customIcon = value;
                      });
                    },
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Nomor Pesanan"),
                            Text("60985827"),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Nama Pemesan"),
                            Text("Joko Santoso"),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Jenis Kamar"),
                            Text("Exclusive Room"),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Email"),
                            Text("jokosantoso@gmail.com"),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
                child: Card(
                  color: background,
                  shadowColor: grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0.r),
                  ),
                  margin: EdgeInsets.zero,
                  child: ExpansionTile(
                    leading: iconformat,
                    title: Text(
                      'Permintaan Khusus',
                      style: GoogleFonts.openSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: mainBlue,
                      ),
                    ),
                    trailing: _customIcon
                        ? const Icon(
                            Icons.expand_less_rounded,
                            color: mainBlue,
                          )
                        : const Icon(
                            Icons.expand_more_rounded,
                            color: mainBlue,
                          ),
                    onExpansionChanged: (bool value) {
                      setState(() {
                        _customIcon = value;
                      });
                    },
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Terdapat bathub jacuzzi, kasur dengan bed king, makanan vegetarian, ramah untuk pengguna kursi roda',
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1.w,
                      blurRadius: 1.w,
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
                child: Card(
                  color: background,
                  shadowColor: grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0.r),
                  ),
                  margin: EdgeInsets.zero,
                  child: ExpansionTile(
                    title: Text(
                      'Detail Pesanan',
                      style: GoogleFonts.openSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: mainBlue,
                      ),
                    ),
                    trailing: _customIcon
                        ? const Icon(
                            Icons.expand_less_rounded,
                            color: mainBlue,
                          )
                        : const Icon(
                            Icons.expand_more_rounded,
                            color: mainBlue,
                          ),
                    onExpansionChanged: (bool value) {
                      setState(() {
                        _customIcon = value;
                      });
                    },
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  bottom: 20,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      10.r), // Image border
                                  child: SizedBox.fromSize(
                                    size: Size.fromRadius(35.r), // Image radius
                                    child: Image.asset(
                                        'assets/images/shibuya.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Shibuya Shabu',
                                    style: GoogleFonts.openSans(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Street View | No Smoking | 2',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    'Single Bed',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 30.h),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                ),
                                child: Text(
                                  'Benefits :',
                                  style: GoogleFonts.openSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  bottom: 10,
                                ),
                                child: Text(
                                  'Free Wifi, Air Mineral, Snack',
                                  style: GoogleFonts.openSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1.w,
                      blurRadius: 1.w,
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
                child: Card(
                  color: background,
                  shadowColor: grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0.r),
                  ),
                  margin: EdgeInsets.zero,
                  child: ExpansionTile(
                    title: Text(
                      'Informasi Pembayaran',
                      style: GoogleFonts.openSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: mainBlue,
                      ),
                    ),
                    trailing: _customIcon
                        ? const Icon(
                            Icons.expand_less_rounded,
                            color: mainBlue,
                          )
                        : const Icon(
                            Icons.expand_more_rounded,
                            color: mainBlue,
                          ),
                    onExpansionChanged: (bool value) {
                      setState(() {
                        _customIcon = value;
                      });
                    },
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1 Kamar x 1 Malam"),
                            Text("Rp. 480.000"),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Promo"),
                            Text("Rp. 0"),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Metode Pembayaran"),
                            SizedBox(
                              width: 50.w,
                              child: Image.asset('assets/images/logo_ovo.png'),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Harga",
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Rp. 480.000",
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStatePropertyAll(
                  Size(350.w, 50.h),
                ),
              ),
              child: Text(
                'Dapatkan Konfirmasi Pesanan',
                style: myTextTheme.headlineMedium,
              ),
              onPressed: () {},
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(
                  buttons,
                ),
                fixedSize: MaterialStatePropertyAll(
                  Size(350.w, 50.h),
                ),
              ),
              child: Text(
                'Batalkan Pesanan',
                style: GoogleFonts.openSans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: mainBlue,
                ),
              ),
              onPressed: _showAlertDialog,
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(
                  buttons,
                ),
                fixedSize: MaterialStatePropertyAll(
                  Size(350.w, 50.h),
                ),
              ),
              child: Text(
                'Kembali ke Beranda',
                style: GoogleFonts.openSans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: mainBlue,
                ),
              ),
              onPressed: () {},
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
