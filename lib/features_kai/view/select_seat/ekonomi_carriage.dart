import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EkonomiCarriage extends StatelessWidget {
  const EkonomiCarriage({
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
              // color: Colors.amber,
              // height: 830.h,
              width: 360.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // list nomorrr
                  Column(
                    children: [
                      const Text('', style: TextStyle(fontSize: 14)),
                      Container(
                        height: 800.h,
                        width: 25.w,
                        margin: EdgeInsets.only(top: 10.h),
                        child: ListView.builder(
                          itemCount: 24,
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
                          height: 800.h,
                          width: 25.w,
                          margin: EdgeInsets.only(top: 10.h),
                          child: ListView.builder(
                            itemCount: 22,
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
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Column(
                      children: [
                        const Text('B', style: TextStyle(fontSize: 14)),
                        Container(
                          height: 800.h,
                          width: 25.w,
                          margin: EdgeInsets.only(top: 10.h),
                          child: ListView.builder(
                            itemCount: 22,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  print('${index + 23}');
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
                  Column(
                    children: [
                      const Text('C', style: TextStyle(fontSize: 14)),
                      Container(
                        height: 701.h,
                        width: 25.w,
                        margin: EdgeInsets.only(top: 109.h),
                        child: ListView.builder(
                          itemCount: 18,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                print('${index + 45}');
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
                  // DDDDDDDDDDDDDD
                  Padding(
                    padding: EdgeInsets.only(left: 58.w, right: 8.w),
                    child: Column(
                      children: [
                        const Text('D', style: TextStyle(fontSize: 14)),
                        Container(
                          height: 734.h,
                          width: 25.w,
                          margin: EdgeInsets.only(top: 76.h),
                          child: ListView.builder(
                            itemCount: 22,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  print('${index + 63}');
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
                  // EEEEEEEEE
                  Column(
                    children: [
                      const Text('E', style: TextStyle(fontSize: 14)),
                      Container(
                        height: 734.h,
                        width: 25.w,
                        margin: EdgeInsets.only(top: 76.h),
                        child: ListView.builder(
                          itemCount: 22,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                print('${index + 85}');
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
