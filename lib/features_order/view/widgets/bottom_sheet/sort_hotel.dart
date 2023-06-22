import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';
import '../../../utils/fonts.dart';

class BottomSheetShortHotel extends StatefulWidget {
  const BottomSheetShortHotel({super.key});

  @override
  State<BottomSheetShortHotel> createState() => _BottomSheetShortHotelState();
}

class _BottomSheetShortHotelState extends State<BottomSheetShortHotel> {
  int selectRadio = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
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
                    'Urutkan',
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
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: buildRadioButton(1, 'Pesanan Terbaru'),
                    ),
                    Expanded(
                      child: buildRadioButton(2, 'Pesanan Terlama'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: buildRadioButton(3, 'Harga Terendah'),
                    ),
                    Expanded(
                      child: buildRadioButton(4, 'Harga Tertinggi'),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
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
                  onPressed: () {
                    print('Klik Tombol');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRadioButton(int value, String title) {
    return RadioListTile(
      title: Text(
        title,
        style: myTextTheme.displayMedium,
      ),
      value: value,
      groupValue: selectRadio,
      onChanged: (value) {
        setState(() {
          selectRadio = value ?? 0;
        });
      },
    );
  }
}
