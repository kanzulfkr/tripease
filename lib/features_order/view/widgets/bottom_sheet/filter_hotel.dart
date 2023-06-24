import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';
import '../../../utils/fonts.dart';

class BottomSheetFilterHotel extends StatefulWidget {
  const BottomSheetFilterHotel({super.key});

  @override
  State<BottomSheetFilterHotel> createState() => _BottomSheetFilterHotelState();
}

class _BottomSheetFilterHotelState extends State<BottomSheetFilterHotel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 464.h,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                ),
                color: mainBlue,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Filter',
                      style: myTextTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama Hotel',
                    style: myTextTheme.labelSmall,
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    style: GoogleFonts.openSans(
                      fontSize: 14.sp,
                      color: black,
                    ),
                    decoration: InputDecoration(
                      labelStyle: GoogleFonts.openSans(
                        color: black,
                      ),
                      contentPadding: EdgeInsets.all(10.w),
                      hintText: 'Masukan nama hotel yang anda cari',
                      hintStyle: myTextTheme.headlineSmall,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Lokasi Hotel',
                    style: myTextTheme.labelSmall,
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    style: GoogleFonts.openSans(
                      fontSize: 14.sp,
                      color: black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.w),
                      hintText: 'Masukan lokasi hotel yag anda cari',
                      hintStyle: myTextTheme.headlineSmall,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Tanggal Pesanan Hotel',
                    style: myTextTheme.labelSmall,
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    style: GoogleFonts.openSans(
                      fontSize: 14.sp,
                      color: black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.w),
                      hintText: 'Pilih tanggal hotel yang anda pesan',
                      hintStyle: myTextTheme.headlineSmall,
                      suffixIcon: Icon(
                        Icons.calendar_month,
                        size: 16.w,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
            ElevatedButton(
              child: Text(
                'Terapkan',
                style: myTextTheme.headlineMedium,
              ),
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(
                  mainBlue,
                ),
                fixedSize: MaterialStatePropertyAll(
                  Size(252.w, 40.h),
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
