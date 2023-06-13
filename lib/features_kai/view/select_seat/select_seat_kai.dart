import 'dart:async';
import 'package:capstone_project_tripease/features_kai/view/select_seat/bisnis_carriage.dart';
import 'package:capstone_project_tripease/features_kai/view/select_seat/ekonomi_carriage.dart';
import 'package:capstone_project_tripease/features_kai/view/select_seat/eksekutif_carriage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';
import '../../view_model/select_seat_kai_provider.dart';
import '../../view_model/timer_seat_provider.dart';

class SelectSeatKai extends StatefulWidget {
  @override
  State<SelectSeatKai> createState() => _SelectSeatKaiState();
}

class _SelectSeatKaiState extends State<SelectSeatKai>
    with TickerProviderStateMixin {
  RxBool isDropdownKereta = false.obs;
  TimerSeatProvider timerText = TimerSeatProvider();
  Timer? countdownTimer;

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
        Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
      }
    });
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0XFF0080FF), // Ukuran tombol

        title: Text(
          'Kursi',
          style:
              GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    isDropdownKereta.toggle();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Consumer<SelectSeatKaiProvider>(
                        builder: (context, controller, _) => Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              hint: Text(
                                'Pilih',
                                style: GoogleFonts.openSans(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                              ),
                              value: controller.selectedValue[0],
                              iconStyleData: const IconStyleData(
                                icon: Icon(Icons.arrow_drop_down),
                                openMenuIcon: Icon(Icons.arrow_drop_up),
                              ),
                              isExpanded: true,
                              underline: const SizedBox(),
                              onChanged: (String? newValue) {
                                controller.selectedValue[0] = newValue!;
                              },
                              items: controller.stringList
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Consumer<TimerSeatProvider>(
                  builder: (context, timerSeat, _) {
                    return Center(
                      child: Text(
                        timerSeat.timer,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: DefaultTabController(
              length: 3,
              child: TabBar(
                controller: tabController,
                tabs: [
                  Tab(
                    child: Text(
                      'Eksekutif - 1',
                      style: GoogleFonts.openSans(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Bisnis - 1',
                      style: GoogleFonts.openSans(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Ekonomi - 1',
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
                Tab(child: EksekutifCarriage()),
                Tab(child: BisnisCarriage()),
                Tab(child: EkonomiCarriage()),
              ],
            ),
          ),
          Container(
            height: 80.h,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(double.maxFinite, 40.h),
                    backgroundColor: const Color(0XFF0080FF), // Ukuran tombol
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
  }
}
