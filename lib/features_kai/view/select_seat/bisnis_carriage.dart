import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BisnisCarriage extends StatelessWidget {
  const BisnisCarriage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550.h,
      width: double.maxFinite,
      child: Row(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              width: 360.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // list nomorrr
                  Column(
                    children: [
                      const Text('', style: TextStyle(fontSize: 14)),
                      Container(
                        height: 600.h,
                        width: 25.w,
                        margin: EdgeInsets.only(top: 10.h),
                        child: ListView.builder(
                          itemCount: 17,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 25.h,
                              width: 25.w,
                              margin: EdgeInsets.only(bottom: 8.h),
                              child: Center(
                                  child: Text(
                                '${index + 1}',
                                style: GoogleFonts.openSans(fontSize: 14),
                              )),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  // AAAAAAAAAAA
                  Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: Column(
                      children: [
                        const Text('A', style: TextStyle(fontSize: 14)),
                        Container(
                          height: 600.h,
                          width: 25.w,
                          margin: EdgeInsets.only(top: 10.h),
                          child: ListView.builder(
                            itemCount: 16,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  print('${index + 1}');
                                },
                                child: Container(
                                  height: 25.h,
                                  width: 25.w,
                                  margin: EdgeInsets.only(bottom: 8.h),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        blurRadius: 4,
                                        spreadRadius: 0,
                                        offset: Offset.zero,
                                      ),
                                    ],
                                    border: Border.all(color: Colors.black38),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // BBBBBBBBBBBB
                  Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: Column(
                      children: [
                        const Text('B', style: TextStyle(fontSize: 14)),
                        Container(
                          height: 600.h,
                          width: 25.w,
                          margin: EdgeInsets.only(top: 10.h),
                          child: ListView.builder(
                            itemCount: 16,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  print('B${index + 1}');
                                },
                                child: Container(
                                  height: 25.h,
                                  width: 25.w,
                                  margin: EdgeInsets.only(bottom: 8.h),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        blurRadius: 4,
                                        spreadRadius: 0,
                                        offset: Offset.zero,
                                      ),
                                    ],
                                    border: Border.all(color: Colors.black38),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  //  CCCCCCCCCCCCCCCCCC
                  Padding(
                    padding: EdgeInsets.only(left: 58.w),
                    child: Column(
                      children: [
                        const Text('C', style: TextStyle(fontSize: 14)),
                        Container(
                          height: 567.h,
                          width: 25.w,
                          margin: EdgeInsets.only(top: 43.h),
                          child: ListView.builder(
                            itemCount: 16,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  print('${index + 33}');
                                },
                                child: Container(
                                  height: 25.h,
                                  width: 25.w,
                                  margin: EdgeInsets.only(bottom: 8.h),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        blurRadius: 4,
                                        spreadRadius: 0,
                                        offset: Offset.zero,
                                      ),
                                    ],
                                    border: Border.all(color: Colors.black38),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // DDDDDDDDDDDDDD
                  Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: Column(
                      children: [
                        const Text('D', style: TextStyle(fontSize: 14)),
                        Container(
                          height: 567.h,
                          width: 25.w,
                          margin: EdgeInsets.only(top: 43.h),
                          child: ListView.builder(
                            itemCount: 16,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  print('${index + 49}');
                                },
                                child: Container(
                                  height: 25.h,
                                  width: 25.w,
                                  margin: EdgeInsets.only(bottom: 8.h),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        blurRadius: 4,
                                        spreadRadius: 0,
                                        offset: Offset.zero,
                                      ),
                                    ],
                                    border: Border.all(color: Colors.black38),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
