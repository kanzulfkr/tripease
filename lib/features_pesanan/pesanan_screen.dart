import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PesananScreen extends StatefulWidget {
  const PesananScreen({Key? key});

  @override
  State<PesananScreen> createState() => _PesananScreenState();
}

class _PesananScreenState extends State<PesananScreen> {
  int itemCount = 19; // Jumlah item count di ListView.separated
  int startingIndex = 3; // Indeks awal item pada ListView.builder

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: double.maxFinite,
      child: ListView.builder(
        itemCount: 22,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Container(
                      width: 15.w,
                      child: Text('${index + 1} '),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 26,
                            itemBuilder: (context, horizontalIndex) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black38),
                                    color: Colors.blue,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: itemCount,
                            separatorBuilder: (context, horizontalIndex) =>
                                SizedBox(width: 10),
                            itemBuilder: (context, horizontalIndex) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black38),
                                    color: Colors.blue,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                itemCount, // Menggunakan nilai variabel itemCount
                            separatorBuilder: (context, horizontalIndex) =>
                                SizedBox(width: 10),
                            itemBuilder: (context, horizontalIndex) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black38),
                                    color: Colors.blue,
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
            ],
          );
        },
      ),
    );
  }
}
