import '/features_order/view_model/provider/train/train_order_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../../../utils/fonts.dart';

class BottomSheetFilterKA extends StatefulWidget {
  const BottomSheetFilterKA({super.key});

  @override
  State<BottomSheetFilterKA> createState() => _BottomSheetFilterKAState();
}

class _BottomSheetFilterKAState extends State<BottomSheetFilterKA> {
  // late _selectedTrain;
  bool isButton1Click = true;
  bool isButton2Click = true;
  bool isButton3Click = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<TrainOrderFilterProvider>(
      builder: (context, trainOrderFilterProvider, _) {
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(
                                    color: isButton1Click
                                        ? mainBlue
                                        : grey), // Menggunakan mainBlue saat tombol diklik
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              isButton1Click
                                  ? mainBlue
                                  : background, // Menggunakan mainBlue saat tombol diklik
                            ),
                          ),
                          child: Text(
                            'Ekonomi',
                            style: GoogleFonts.openSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: isButton1Click ? white : grey,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isButton2Click = !isButton2Click;
                            });
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(
                                    color: isButton2Click
                                        ? mainBlue
                                        : grey), // Menggunakan mainBlue saat tombol diklik
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              isButton2Click
                                  ? mainBlue
                                  : background, // Menggunakan mainBlue saat tombol diklik
                            ),
                          ),
                          child: Text(
                            'Bisnis',
                            style: GoogleFonts.openSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: isButton2Click ? white : grey,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isButton3Click = !isButton3Click;
                            });
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(
                                    color: isButton3Click
                                        ? mainBlue
                                        : grey), // Menggunakan mainBlue saat tombol diklik
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              isButton3Click
                                  ? mainBlue
                                  : background, // Menggunakan mainBlue saat tombol diklik
                            ),
                          ),
                          child: Text(
                            'Eksekutif',
                            style: GoogleFonts.openSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: isButton3Click ? white : grey,
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
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
