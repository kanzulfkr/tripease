import 'package:capstone_project_tripease/features_kai/view_model/station/return_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../view_model/carriage/carriage_return_provider.dart';
import '../../../view_model/carriage/select_seat_return_provider.dart';

class ReturnCarriagePage extends StatefulWidget {
  const ReturnCarriagePage({super.key});

  @override
  State<ReturnCarriagePage> createState() => _ReturnCarriagePageState();
}

class _ReturnCarriagePageState extends State<ReturnCarriagePage> {
  @override
  Widget build(BuildContext context) {
    final returnProv = Provider.of<ReturnProvider>(context, listen: false);
    final classTrain =
        returnProv.returns[returnProv.selectedDepartIndex as int].datumClass;
    int? countNumberClass;
    int? listHeightClass;
    int? listHeightClassA;
    int? listHeightClassB;
    int? listHeightClassC;
    int? listHeightClassD;
    int? listHeightClassE;
    int? paddingTopClassA;
    int? paddingTopClassB;
    int? paddingTopClassC;
    int? paddingTopClassD;
    int? paddingTopClassE;
    if (classTrain == 'Ekonomi') {
      countNumberClass = 24;
      listHeightClass = 800;
      listHeightClassA = 800;
      listHeightClassB = 800;
      listHeightClassC = 701;
      listHeightClassD = 734;
      listHeightClassE = 734;
      paddingTopClassA = 10;
      paddingTopClassB = 10;
      paddingTopClassC = 109;
      paddingTopClassD = 76;
      paddingTopClassE = 76;
    } else if (classTrain == 'Bisnis') {
      countNumberClass = 17;
      listHeightClass = 580;
      listHeightClassA = 580;
      listHeightClassB = 580;
      listHeightClassC = 547;
      listHeightClassD = 547;
      paddingTopClassA = 10;
      paddingTopClassB = 10;
      paddingTopClassC = 43;
      paddingTopClassD = 43;
    } else if (classTrain == 'Eksekutif') {
      countNumberClass = 13;
      listHeightClass = 450;
      listHeightClassA = 450;
      listHeightClassB = 450;
      listHeightClassC = 450;
      listHeightClassD = 417;
      paddingTopClassA = 10;
      paddingTopClassB = 10;
      paddingTopClassC = 10;
      paddingTopClassD = 43;
    }

    return Consumer<SelectedSeatsReturnProvider>(
      builder: (context, selectedSeatReturnProvider, _) {
        return SizedBox(
          height: 550.h,
          width: double.maxFinite,
          child: Row(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  width: 360.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // list nomorrr
                      Column(
                        children: [
                          Text('', style: TextStyle(fontSize: 14.sp)),
                          Container(
                            height: listHeightClass!.h,
                            width: 25.w,
                            margin: EdgeInsets.only(top: 10.h),
                            child: ListView.builder(
                              itemCount: countNumberClass!,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 25.h,
                                  width: 25.w,
                                  margin: EdgeInsets.only(bottom: 8.h),
                                  child: Center(
                                      child: Text(
                                    '${index + 1}',
                                    style:
                                        GoogleFonts.openSans(fontSize: 14.sp),
                                  )),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      // AAAAAAAAAAA
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Column(
                          children: [
                            Text('A', style: TextStyle(fontSize: 14.sp)),
                            Container(
                              height: listHeightClassA!.h,
                              width: 25.w,
                              margin: EdgeInsets.only(top: paddingTopClassA!.h),
                              child: Consumer<CarriageReturnProvider>(
                                builder: (context, carriageProvider, child) {
                                  return ListView.builder(
                                    itemCount: carriageProvider.seatA.length,
                                    itemBuilder: (context, index) {
                                      final selectedSeatsProvider = Provider.of<
                                          SelectedSeatsReturnProvider>(context);
                                      final selectedSeats =
                                          selectedSeatsProvider.selectedSeats;
                                      final item =
                                          carriageProvider.seatA[index];
                                      final isSeatSelected =
                                          selectedSeats.contains(item.id);

                                      final color = isSeatSelected
                                          ? Colors.blue
                                          : Colors.white;

                                      return InkWell(
                                        onTap: () {
                                          selectedSeatsProvider.selectedSeats;
                                          if (item.available == false) {
                                            print('kursi sudah dibooking');
                                          } else if (item.available == true) {
                                            if (isSeatSelected) {
                                              selectedSeatsProvider
                                                  .deselectSeat(item.id);
                                            } else {
                                              selectedSeatsProvider
                                                  .selectSeat(item.id);
                                            }
                                            carriageProvider
                                                .setTrainSeatId(item.id);
                                            print('Kursi pulang : ${item.id}');
                                          }
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
                                            border: Border.all(
                                                color: Colors.black38),
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            color: item.available == true
                                                ? isSeatSelected
                                                    ? Colors.blue
                                                    : color
                                                : Colors.red,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      // BBBBBBBBBBBB
                      Column(
                        children: [
                          Text('B', style: TextStyle(fontSize: 14.sp)),
                          Container(
                            height: listHeightClassB!.h,
                            width: 25.w,
                            margin: EdgeInsets.only(top: paddingTopClassB!.h),
                            child: Consumer<CarriageReturnProvider>(
                              builder: (context, carriageProvider, child) {
                                return ListView.builder(
                                  itemCount: carriageProvider.seatB.length,
                                  itemBuilder: (context, index) {
                                    final selectedSeatsProvider = Provider.of<
                                        SelectedSeatsReturnProvider>(context);
                                    final selectedSeats =
                                        selectedSeatsProvider.selectedSeats;
                                    final item = carriageProvider.seatA[index];
                                    final isSeatSelected =
                                        selectedSeats.contains(item.id);

                                    final color = isSeatSelected
                                        ? Colors.blue
                                        : Colors.white;

                                    return InkWell(
                                      onTap: () {
                                        selectedSeatsProvider.selectedSeats;
                                        if (item.available == false) {
                                          print('kursi sudah dibooking');
                                        } else if (item.available == true) {
                                          if (isSeatSelected) {
                                            selectedSeatsProvider
                                                .deselectSeat(item.id);
                                          } else {
                                            selectedSeatsProvider
                                                .selectSeat(item.id);
                                          }
                                          carriageProvider
                                              .setTrainSeatId(item.id);
                                          print('Kursi pulang : ${item.id}');
                                        }
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
                                          border:
                                              Border.all(color: Colors.black38),
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          color: item.available == true
                                              ? isSeatSelected
                                                  ? Colors.blue
                                                  : color
                                              : Colors.red,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      //  CCCCCCCCCCCCCCCCCC
                      Padding(
                        padding: EdgeInsets.only(
                          left: classTrain == 'Bisnis' ||
                                  classTrain == 'Eksekutif'
                              ? 50.w
                              : 8.w,
                          right: classTrain == 'Bisnis' ||
                                  classTrain == 'Eksekutif'
                              ? 8.w
                              : 50.w,
                        ),
                        child: Column(
                          children: [
                            Text('C', style: TextStyle(fontSize: 14.sp)),
                            Container(
                              height: listHeightClassC!.h,
                              width: 25.w,
                              margin: EdgeInsets.only(top: paddingTopClassC!.h),
                              child: Consumer<CarriageReturnProvider>(
                                builder: (context, carriageProvider, child) {
                                  return ListView.builder(
                                    itemCount: carriageProvider.seatC.length,
                                    itemBuilder: (context, index) {
                                      final selectedSeatsProvider = Provider.of<
                                          SelectedSeatsReturnProvider>(context);
                                      final selectedSeats =
                                          selectedSeatsProvider.selectedSeats;
                                      final item =
                                          carriageProvider.seatA[index];
                                      final isSeatSelected =
                                          selectedSeats.contains(item.id);

                                      final color = isSeatSelected
                                          ? Colors.blue
                                          : Colors.white;

                                      return InkWell(
                                        onTap: () {
                                          selectedSeatsProvider.selectedSeats;
                                          if (item.available == false) {
                                            print('kursi sudah dibooking');
                                          } else if (item.available == true) {
                                            if (isSeatSelected) {
                                              selectedSeatsProvider
                                                  .deselectSeat(item.id);
                                            } else {
                                              selectedSeatsProvider
                                                  .selectSeat(item.id);
                                            }
                                            carriageProvider
                                                .setTrainSeatId(item.id);
                                            print('Kursi pulang : ${item.id}');
                                          }
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
                                            border: Border.all(
                                                color: Colors.black38),
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            color: item.available == true
                                                ? isSeatSelected
                                                    ? Colors.blue
                                                    : color
                                                : Colors.red,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      // DDDDDDDDDDDDDD
                      Column(
                        children: [
                          Text('D', style: TextStyle(fontSize: 14.sp)),
                          Container(
                            height: listHeightClassD!.h,
                            width: 25.w,
                            margin: EdgeInsets.only(top: paddingTopClassD!.h),
                            child: Consumer<CarriageReturnProvider>(
                              builder: (context, carriageProvider, child) {
                                return ListView.builder(
                                  itemCount: carriageProvider.seatD.length,
                                  itemBuilder: (context, index) {
                                    final selectedSeatsProvider = Provider.of<
                                        SelectedSeatsReturnProvider>(context);
                                    final selectedSeats =
                                        selectedSeatsProvider.selectedSeats;
                                    final item = carriageProvider.seatA[index];
                                    final isSeatSelected =
                                        selectedSeats.contains(item.id);

                                    final color = isSeatSelected
                                        ? Colors.blue
                                        : Colors.white;

                                    return InkWell(
                                      onTap: () {
                                        selectedSeatsProvider.selectedSeats;
                                        if (item.available == false) {
                                          print('kursi sudah dibooking');
                                        } else if (item.available == true) {
                                          if (isSeatSelected) {
                                            selectedSeatsProvider
                                                .deselectSeat(item.id);
                                          } else {
                                            selectedSeatsProvider
                                                .selectSeat(item.id);
                                          }
                                          carriageProvider
                                              .setTrainSeatId(item.id);
                                          print('Kursi pulang : ${item.id}');
                                        }
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
                                          border:
                                              Border.all(color: Colors.black38),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: item.available == true
                                              ? isSeatSelected
                                                  ? Colors.blue
                                                  : color
                                              : Colors.red,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      classTrain == 'Bisnis' || classTrain == 'Eksekutif'
                          ? const SizedBox()
                          :
                          // EEEEEEEEE
                          Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Column(
                                children: [
                                  Text('E', style: TextStyle(fontSize: 14.sp)),
                                  Container(
                                    height: listHeightClassE!.h,
                                    width: 25.w,
                                    margin: EdgeInsets.only(
                                        top: paddingTopClassE!.h),
                                    child: Consumer<CarriageReturnProvider>(
                                      builder:
                                          (context, carriageProvider, child) {
                                        return ListView.builder(
                                          itemCount:
                                              carriageProvider.seatE.length,
                                          itemBuilder: (context, index) {
                                            final selectedSeatsProvider = Provider
                                                .of<SelectedSeatsReturnProvider>(
                                                    context);
                                            final selectedSeats =
                                                selectedSeatsProvider
                                                    .selectedSeats;
                                            final item =
                                                carriageProvider.seatA[index];
                                            final isSeatSelected =
                                                selectedSeats.contains(item.id);

                                            final color = isSeatSelected
                                                ? Colors.blue
                                                : Colors.white;

                                            return InkWell(
                                              onTap: () {
                                                selectedSeatsProvider
                                                    .selectedSeats;
                                                if (item.available == false) {
                                                  print(
                                                      'kursi sudah dibooking');
                                                } else if (item.available ==
                                                    true) {
                                                  if (isSeatSelected) {
                                                    selectedSeatsProvider
                                                        .deselectSeat(item.id);
                                                  } else {
                                                    selectedSeatsProvider
                                                        .selectSeat(item.id);
                                                  }
                                                  carriageProvider
                                                      .setTrainSeatId(item.id);
                                                  print(
                                                      'Kursi pulang : ${item.id}');
                                                }
                                              },
                                              child: Container(
                                                height: 25.h,
                                                width: 25.w,
                                                margin: EdgeInsets.only(
                                                    bottom: 8.h),
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          Colors.grey.shade400,
                                                      blurRadius: 4,
                                                      spreadRadius: 0,
                                                      offset: Offset.zero,
                                                    ),
                                                  ],
                                                  border: Border.all(
                                                      color: Colors.black38),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  color: item.available == true
                                                      ? isSeatSelected
                                                          ? Colors.blue
                                                          : color
                                                      : Colors.red,
                                                ),
                                              ),
                                            );
                                          },
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
      },
    );
  }
}
