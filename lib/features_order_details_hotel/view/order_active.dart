import 'package:capstone_project_tripease/features_order/utils/colors.dart';
import 'package:capstone_project_tripease/features_order/utils/icons.dart';
import 'package:capstone_project_tripease/features_order/utils/images.dart';
import 'package:capstone_project_tripease/features_order_details_hotel/view/order_cancceled.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../features_checkin_checkout/component/button_active.dart';
import '../features_checkin_checkout/component/button_close.dart';
import '../../../../home.dart';
import '../features_checkin_checkout/check_in.dart';
import '../../features_order/utils/fonts.dart';

class OrderActive extends StatefulWidget {
  const OrderActive({super.key});

  @override
  State<OrderActive> createState() => _OrderActiveState();
}

class _OrderActiveState extends State<OrderActive> {
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
                          builder: (context) => const OrderCanccel(),
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

  late bool _customIcon1 = false;
  late bool _customIcon2 = false;
  late bool _customIcon3 = false;
  late bool _customIcon4 = false;

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
                padding: EdgeInsets.only(
                  top: 20.h,
                  left: 20.w,
                  right: 20.w,
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
                    padding: EdgeInsets.all(10.0.w),
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
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 20.h,
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
                      padding: EdgeInsets.only(
                        top: 10.h,
                        left: 10.w,
                        right: 10.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 10.w,
                            ),
                            child: Text(
                              'Shibuya Shabu',
                              style: myTextTheme.displayMedium,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 5.h,
                              left: 10.w,
                            ),
                            child: Text(
                              'Thonglor Soi 20, Bangkok Thailand',
                              style: myTextTheme.headlineSmall,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.h,
                              left: 10.w,
                              bottom: 10.h,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
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
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
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
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
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
                    trailing: _customIcon1
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
                        _customIcon1 = value;
                      });
                    },
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Nomor Pesanan"),
                            Text("60985827"),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Nama Pemesan"),
                            Text("Joko Santoso"),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Jenis Kamar"),
                            Text("Exclusive Room"),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        child: const Row(
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
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
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
                    leading: iconformat,
                    title: Text(
                      'Permintaan Khusus',
                      style: GoogleFonts.openSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: mainBlue,
                      ),
                    ),
                    trailing: _customIcon2
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
                        _customIcon2 = value;
                      });
                    },
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: const Text(
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
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
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
                    trailing: _customIcon3
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
                        _customIcon3 = value;
                      });
                    },
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 20.w,
                                  bottom: 20.h,
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
                                padding: EdgeInsets.only(
                                  left: 20.w,
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
                                padding: EdgeInsets.only(
                                  left: 20.w,
                                  bottom: 10.h,
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
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
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
                    trailing: _customIcon4
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
                        _customIcon4 = value;
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Promo"),
                            Text("Rp. 0"),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
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
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Harga",
                              style: GoogleFonts.openSans(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Rp. 480.000",
                              style: GoogleFonts.openSans(
                                fontSize: 14.sp,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                    Size(350.w, 50.h),
                  ),
                ),
                child: Text(
                  'Dapatkan Konfirmasi Pesanan',
                  style: myTextTheme.headlineMedium,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CheckIn(
                      title: 'Shibuya Shabu',
                    ),
                  ));
                },
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: ElevatedButton(
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
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: ElevatedButton(
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
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
