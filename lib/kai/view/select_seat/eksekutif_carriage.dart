// ignore_for_file: avoid_print

import 'package:capstone_project_tripease/kai/view_model/get_train_carriage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EksekutifCarriage extends StatefulWidget {
  const EksekutifCarriage({
    super.key,
  });

  @override
  State<EksekutifCarriage> createState() => _EksekutifCarriageState();
}

class _EksekutifCarriageState extends State<EksekutifCarriage> {
  var seatApiModel = SeatApiModel();

  @override
  void initState() {
    super.initState();
    seatApiModel.dataCarriage3('Eksekutif', 1);
  }

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // list nomorrr
                  Column(
                    children: [
                      const Text('', style: TextStyle(fontSize: 14)),
                      Container(
                        height: 450.h,
                        width: 25.w,
                        margin: EdgeInsets.only(top: 10.h),
                        child: ListView.builder(
                          itemCount: 13,
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
                          height: 450.h,
                          width: 25.w,
                          margin: EdgeInsets.only(top: 10.h),
                          child: StreamBuilder<List<Map<String, dynamic>>>(
                            stream: seatApiModel.listAStream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: seatApiModel.listA.length,
                                  itemBuilder: (context, index) {
                                    // var item = seatApiModel.listA[index];
                                    // var id = item['id'];
                                    // var name = item['name'];
                                    return InkWell(
                                      onTap: () {
                                        setState(() {});
                                        var item = seatApiModel.listA[index];
                                        var id = item['id'];
                                        var name = item['name'];
                                        var available = item['available'];
                                        print(id);
                                        print(name);
                                        print(available);
                                      },
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        margin: EdgeInsets.only(bottom: 8),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade400,
                                              blurRadius: 4,
                                              spreadRadius: 0,
                                              offset: Offset.zero,
                                            ),
                                          ],
                                          border:
                                              Border.all(color: Colors.black38),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return const CircularProgressIndicator(
                                  color: Colors.white,
                                );
                              }
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
                          height: 450.h,
                          width: 25.w,
                          margin: EdgeInsets.only(top: 10.h),
                          child: StreamBuilder<List<Map<String, dynamic>>>(
                            stream: seatApiModel.listAStream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: seatApiModel.listB.length,
                                  itemBuilder: (context, index) {
                                    // var item = seatApiModel.listA[index];
                                    // var id = item['id'];
                                    // var name = item['name'];
                                    return InkWell(
                                      onTap: () {
                                        setState(() {});
                                        var item = seatApiModel.listB[index];
                                        var id = item['id'];
                                        var name = item['name'];
                                        var available = item['available'];
                                        print(id);
                                        print(name);
                                        print(available);
                                      },
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        margin: EdgeInsets.only(bottom: 8),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade400,
                                              blurRadius: 4,
                                              spreadRadius: 0,
                                              offset: Offset.zero,
                                            ),
                                          ],
                                          border:
                                              Border.all(color: Colors.black38),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return const CircularProgressIndicator(
                                  color: Colors.white,
                                );
                              }
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
                        height: 450.h,
                        width: 25.w,
                        margin: EdgeInsets.only(top: 10.h),
                        child: StreamBuilder<List<Map<String, dynamic>>>(
                          stream: seatApiModel.listAStream,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                itemCount: seatApiModel.listC.length,
                                itemBuilder: (context, index) {
                                  // var item = seatApiModel.listA[index];
                                  // var id = item['id'];
                                  // var name = item['name'];
                                  return InkWell(
                                    onTap: () {
                                      setState(() {});
                                      var item = seatApiModel.listC[index];
                                      var id = item['id'];
                                      var name = item['name'];
                                      var available = item['available'];
                                      print(id);
                                      print(name);
                                      print(available);
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      margin: EdgeInsets.only(bottom: 8),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade400,
                                            blurRadius: 4,
                                            spreadRadius: 0,
                                            offset: Offset.zero,
                                          ),
                                        ],
                                        border:
                                            Border.all(color: Colors.black38),
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              return const CircularProgressIndicator(
                                color: Colors.white,
                              );
                            }
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
                          height: 450.h,
                          width: 25.w,
                          margin: EdgeInsets.only(top: 43.h),
                          child: StreamBuilder<List<Map<String, dynamic>>>(
                            stream: seatApiModel.listAStream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: seatApiModel.listD.length,
                                  itemBuilder: (context, index) {
                                    // var item = seatApiModel.listA[index];
                                    // var id = item['id'];
                                    // var name = item['name'];
                                    return InkWell(
                                      onTap: () {
                                        setState(() {});
                                        var item = seatApiModel.listD[index];
                                        var id = item['id'];
                                        var name = item['name'];
                                        var available = item['available'];
                                        print(id);
                                        print(name);
                                        print(available);
                                      },
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        margin: EdgeInsets.only(bottom: 8),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.shade400,
                                              blurRadius: 4,
                                              spreadRadius: 0,
                                              offset: Offset.zero,
                                            ),
                                          ],
                                          border:
                                              Border.all(color: Colors.black38),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return const CircularProgressIndicator(
                                  color: Colors.white,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // EEEEEEEEE
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
