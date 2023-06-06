import 'dart:async';

import 'package:capstone_project_tripease/kai/view_model/select_seat_kai_provider.dart';
import 'package:capstone_project_tripease/kai/view_model/timer_seat_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';

class SelectSeatKai extends StatefulWidget {
  @override
  State<SelectSeatKai> createState() => _SelectSeatKaiState();
}

class _SelectSeatKaiState extends State<SelectSeatKai> {
  RxBool isDropdownKereta = false.obs;
  TimerSeatProvider timerText = TimerSeatProvider();
  Timer? countdownTimer;
  @override
  void initState() {
    super.initState();
    TimerSeatProvider timerSeat =
        Provider.of<TimerSeatProvider>(context, listen: false);
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
    final SelectSeatKaiProvider controller =
        Provider.of<SelectSeatKaiProvider>(context, listen: false);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Kursi',
            style:
                GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              child: GestureDetector(
                                onTap: () {
                                  isDropdownKereta.toggle();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Consumer<SelectSeatKaiProvider>(
                                      builder: (context, controller, _) =>
                                          Container(
                                        height: 40,
                                        width: 250,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          border:
                                              Border.all(color: Colors.grey),
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
                                              openMenuIcon:
                                                  Icon(Icons.arrow_drop_up),
                                            ),
                                            isExpanded: true,
                                            underline: const SizedBox(),
                                            onChanged: (String? newValue) {
                                              controller.selectedValue[0] =
                                                  newValue!;
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
                            ),
                            Center(
                              child: Consumer<TimerSeatProvider>(
                                builder: (context, timerSeat, _) {
                                  return Text(
                                    timerSeat.timer,
                                    style: TextStyle(fontSize: 20),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12, left: 20),
                          child: TabBar(
                            tabs: [
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
                              Tab(
                                child: Text(
                                  'Eko - 4',
                                  style: GoogleFonts.openSans(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Eko - 5',
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
                        const SizedBox(height: 30),
                        Container(
                          padding: EdgeInsets.only(left: 75),
                          child: Row(
                            children: [
                              SizedBox(width: 20), // Jarak sebelum huruf A
                              Container(
                                width: 20,
                                alignment: Alignment.center,
                                child: Text(
                                  'A',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              // Jarak antara huruf A dan B
                              Container(
                                width: 60,
                                alignment: Alignment.center,
                                child: Text(
                                  'B',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              // Jarak antara huruf B dan C
                              Container(
                                width: 30,
                                alignment: Alignment.center,
                                child: Text(
                                  'C',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              SizedBox(width: 70), // Jarak antara huruf C dan D
                              Container(
                                width: 60,
                                alignment: Alignment.center,
                                child: Text(
                                  'D',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              SizedBox(width: 5), // Jarak antara huruf D dan E
                              Container(
                                width: 20,
                                alignment: Alignment.center,
                                child: Text(
                                  'E',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 60,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: ListView.separated(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(
                                              height: 0,
                                            ),
                                            itemCount: (Provider.of<
                                                                SelectSeatKaiProvider>(
                                                            context)
                                                        .gerbong[Provider.of<
                                                                    SelectSeatKaiProvider>(
                                                                context)
                                                            .indexGerbong]
                                                        .length /
                                                    7)
                                                .ceil(),
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 1),
                                                child: Container(
                                                  height: 43,
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    "${index + 1}",
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      // Tambahkan widget lainnya di sini
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    margin: const EdgeInsets.only(right: 20),
                                    child: Consumer<SelectSeatKaiProvider>(
                                      builder: (context, controller, _) =>
                                          GridView.builder(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 10),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 10,
                                          crossAxisCount: 7,
                                        ),
                                        itemCount: controller
                                            .gerbong[controller.indexGerbong]
                                            .length,
                                        itemBuilder: (context, index) {
                                          if (index % 7 == 3 ||
                                              index % 7 == 4) {
                                            return const SizedBox(width: 3);
                                          } else {
                                            final seat = controller.gerbong[
                                                controller.indexGerbong][index];
                                            final isAvailable =
                                                seat["status"] == "available";
                                            final isSelected = controller
                                                .selectedSeatIndices
                                                .contains(index);

                                            return GestureDetector(
                                              onTap: () =>
                                                  controller.selectKursi(index),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black38),
                                                  color: isSelected
                                                      ? Colors.blue
                                                      : (isAvailable
                                                          ? Colors.white
                                                          : Colors.red),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              for (int index
                                  in controller.selectedSeatIndices) {
                                controller.gerbong[controller.indexGerbong]
                                    [index]["status"] = "disabled";
                              }
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(252, 40), // Ukuran tombol
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      5), // Sudut melengkung dengan jari-jari 5
                                ),
                                padding: const EdgeInsets.fromLTRB(
                                    24, 0, 24, 0), // Padding di kiri dan kanan
                                primary: const Color(
                                    0XFF0080FF) // Warna latar belakang biru
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemStatus extends StatelessWidget {
  ItemStatus({
    Key? key,
    required this.status,
    required this.color,
  }) : super(key: key);

  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(width: 7),
        Text(
          status,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
