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

  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  bool checkbox4 = false;
  bool checkbox5 = false;
  bool checkbox6 = false;
  bool checkbox7 = false;
  bool checkbox8 = false;

  List<String> _trainList = [
    'Kereta Api A',
    'Kereta Api B',
    'Kereta Api C',
    'Kereta Api D',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 560.h,
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
                Text(
                  'Nama Kereta Api',
                  style: myTextTheme.labelSmall,
                ),
                SizedBox(height: 10.h),
                DropdownButtonFormField(
                  style: GoogleFonts.openSans(
                    fontSize: 12.sp,
                    color: black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    hintText: 'Pilih Nama Kereta Api',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  items: _trainList.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    _selectedTrain = newValue!;
                  },
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Waktu Keberangkatan',
                      style: myTextTheme.labelSmall,
                    ),
                    Text(
                      'Waktu Tiba',
                      style: myTextTheme.labelSmall,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        title: Text(
                          '00.00 - 06.00',
                          style: myTextTheme.headlineSmall,
                        ),
                        value: checkbox1,
                        onChanged: (value) {
                          setState(() {
                            checkbox1 = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        title: Text(
                          '00.00 - 06.00',
                          style: myTextTheme.headlineSmall,
                        ),
                        value: checkbox2,
                        onChanged: (value) {
                          setState(() {
                            checkbox2 = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        title: Text(
                          '06.00 - 12.00',
                          style: myTextTheme.headlineSmall,
                        ),
                        value: checkbox3,
                        onChanged: (value) {
                          setState(() {
                            checkbox3 = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        title: Text(
                          '06.00 - 12.00',
                          style: myTextTheme.headlineSmall,
                        ),
                        value: checkbox4,
                        onChanged: (value) {
                          setState(() {
                            checkbox4 = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        title: Text(
                          '12.00 - 18.00',
                          style: myTextTheme.headlineSmall,
                        ),
                        value: checkbox5,
                        onChanged: (value) {
                          setState(() {
                            checkbox5 = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        title: Text(
                          '12.00 - 18.00',
                          style: myTextTheme.headlineSmall,
                        ),
                        value: checkbox6,
                        onChanged: (value) {
                          setState(() {
                            checkbox6 = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        title: Text(
                          '18.00 -  24.00',
                          style: myTextTheme.headlineSmall,
                        ),
                        value: checkbox7,
                        onChanged: (value) {
                          setState(() {
                            checkbox7 = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        title: Text(
                          '18.00 -  24.00',
                          style: myTextTheme.headlineSmall,
                        ),
                        value: checkbox8,
                        onChanged: (value) {
                          setState(() {
                            checkbox8 = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ],
                ),
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
    ;
  }
}
