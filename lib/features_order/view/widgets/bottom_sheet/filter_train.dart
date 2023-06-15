import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';
import '../../../utils/fonts.dart';

class BottomSheetFilterKA extends StatefulWidget {
  const BottomSheetFilterKA({super.key});

  @override
  State<BottomSheetFilterKA> createState() => _BottomSheetFilterKAState();
}

class _BottomSheetFilterKAState extends State<BottomSheetFilterKA> {
  late String _selectedTrain;
  bool isButton1Click = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
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
                  'Jenis Kereta Api',
                  style: myTextTheme.labelSmall,
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isButton1Click = !isButton1Click;
                        });
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: grey),
                          ),
                        ),
                        backgroundColor:
                            const MaterialStatePropertyAll(background),
                      ),
                      child: Text(
                        'Ekonomi',
                        style: GoogleFonts.openSans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: grey,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0.r),
                            side: const BorderSide(color: grey),
                          ),
                        ),
                        backgroundColor:
                            const MaterialStatePropertyAll(background),
                      ),
                      child: Text(
                        'Bisnis',
                        style: GoogleFonts.openSans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: grey,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0.r),
                            side: const BorderSide(color: grey),
                          ),
                        ),
                        backgroundColor:
                            const MaterialStatePropertyAll(background),
                      ),
                      child: Text(
                        'Eksekutif',
                        style: GoogleFonts.openSans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: grey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
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
    );
  }
}
