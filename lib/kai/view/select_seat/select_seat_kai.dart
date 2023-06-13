import 'dart:async';

import 'package:capstone_project_tripease/kai/view/select_seat/bisnis_carriage.dart';
import 'package:capstone_project_tripease/kai/view/select_seat/ekonomi_carriage.dart';
import 'package:capstone_project_tripease/kai/view/select_seat/eksekutif_carriage.dart';
import 'package:capstone_project_tripease/kai/view_model/get_train_carriage.dart';
import 'package:capstone_project_tripease/kai/view_model/select_seat_kai_provider.dart';
import 'package:capstone_project_tripease/kai/view_model/time_payment_provider.dart';
import 'package:capstone_project_tripease/kai/view_model/timer_seat_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectSeatKai extends StatefulWidget {
  final int passengerNumber;
  final String jenisKA;

  const SelectSeatKai(
      {super.key, required this.passengerNumber, required this.jenisKA});

  @override
  State<SelectSeatKai> createState() => _SelectSeatKaiState();
}

class _SelectSeatKaiState extends State<SelectSeatKai>
    with TickerProviderStateMixin {
  RxBool isDropdownKereta = false.obs;
  TimerPaymentProvider timerText = TimerPaymentProvider();
  Timer? countdownTimer;
  final List<int> selectedIndexes = [];
  var seatApiModel = SeatApiModel();

  @override
  void initState() {
    super.initState();
    TimerSeatProvider timerSeat =
        Provider.of<TimerSeatProvider>(context, listen: false);
    timerSeat.stopCountDown();
    timerSeat.startCountDown(context);
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
      if (timerSeat.isTimeUp()) {
        countdownTimer?.cancel();
        Navigator.of(context).pop();
      }
    });
    seatApiModel.dataCarriage1('Ekonomi', 1);
  }

  @override
  void dispose() {
    countdownTimer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 5, vsync: this);
    return Consumer<SelectedSeatsProvider>(
      builder: (context, seatProvider, _) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: const Color(0XFF0080FF), // Ukuran tombol

            title: Text(
              'Kursi',
              style: GoogleFonts.openSans(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20.w, left: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 40.h,
                          width: 250.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.h, top: 10.h),
                            child: Text(
                              'Penumpang ${widget.passengerNumber}',
                              style: GoogleFonts.openSans(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Consumer<TimerSeatProvider>(
                      builder: (context, timerSeat, _) {
                        return Text(timerSeat.timer,
                            style: GoogleFonts.openSans(
                                fontSize: 14.sp, fontWeight: FontWeight.w600));
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: DefaultTabController(
                  length: 5,
                  child: TabBar(
                    controller: tabController,
                    tabs: [
                      // if (widget.jenisKA == 'Ekonomi')
                      Tab(
                        child: Text(
                          'Eko - 1',
                          style: GoogleFonts.openSans(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Eko - 2',
                          style: GoogleFonts.openSans(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Eko - 3',
                          style: GoogleFonts.openSans(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ),

                      // if (widget.jenisKA == 'Bisnis')
                      Tab(
                        child: Text(
                          'Bis - 1',
                          style: GoogleFonts.openSans(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      // if (widget.jenisKA == 'Eksekutif')
                      Tab(
                        child: Text(
                          'Eks - 1',
                          style: GoogleFonts.openSans(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 490.h,
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    Tab(child: EkonomiCarriage()),
                    Tab(child: EkonomiCarriage()),
                    Tab(child: EkonomiCarriage()),
                    Tab(child: BisnisCarriage()),
                    Tab(child: EksekutifCarriage()),
                  ],
                ),
              ),
              Container(
                height: 80.h,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Melakukan perubahan pada state seatProvider
                      });
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(double.maxFinite, 40.h),
                        backgroundColor:
                            const Color(0XFF0080FF), // Ukuran tombol
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              5), // Sudut melengkung dengan jari-jari 5
                        ),
                        padding: const EdgeInsets.fromLTRB(
                            24, 0, 24, 0) // Warna latar belakang biru
                        ),
                    child: Text(
                      'Konfirmasi',
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white, // Warna teks putih
                      ),
                    ),
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
