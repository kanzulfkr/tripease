// import 'package:capstone_project_tripease/kai/view_model/select_seat_kai_controller.dart';
// import 'package:capstone_project_tripease/kai/view_model/timer_select_seat.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SelectSeatKai extends GetView<SelectSeatKaiController> {
//   TimerText timerText = Get.put(TimerText());
//   RxBool isDropdownKereta = false.obs;

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 5,
//       child: Scaffold(
//         body: Stack(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.5),
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(30),
//                         topRight: Radius.circular(30),
//                       ),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 20, top: 20),
//                               child: GestureDetector(
//                                 onTap: () {
//                                   isDropdownKereta.toggle();
//                                 },
//                                 child: Container(
//                                   height: 48,
//                                   width: 250,
//                                   margin:
//                                       const EdgeInsets.only(left: 0, top: 0),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(8),
//                                     color: const Color(0xF9FAFBFB),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.grey.withOpacity(0.5),
//                                         spreadRadius: 0.2,
//                                         blurRadius: 0.5,
//                                         offset: const Offset(0.5, 0.5),
//                                       ),
//                                     ],
//                                   ),
//                                   padding: const EdgeInsets.all(12),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Obx(() => Text(
//                                             '${controller.selectedValue.value}',
//                                             style: GoogleFonts.openSans(
//                                               fontSize: 14,
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           )),
//                                       const SizedBox(
//                                         width: 10,
//                                       ),
//                                       Icon(
//                                         isDropdownKereta.value
//                                             ? Icons.arrow_drop_up
//                                             : Icons.arrow_drop_down,
//                                       ),
//                                       const SizedBox(
//                                         width: 37,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Center(
//                               child: Container(
//                                 padding:
//                                     const EdgeInsets.only(top: 20, left: 37),
//                                 child: Obx(
//                                   () => Text(
//                                     timerText.timer.value,
//                                     style: TextStyle(fontSize: 16),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Obx(() {
//                           return ListView.builder(
//                             itemCount: controller.stringList.length,
//                             itemBuilder: (context, index) {
//                               return InkWell(
//                                 onTap: () {
//                                   controller.updateSelectedValue(
//                                       controller.stringList[index]);
//                                 },
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(vertical: 8.0),
//                                   child: Obx(() {
//                                     final isSelected = controller.selectedValue
//                                         .contains(controller.stringList[index]);
//                                     return Text(
//                                       controller.stringList[index],
//                                       style: TextStyle(
//                                         color: isSelected
//                                             ? Colors.blue
//                                             : Colors.black,
//                                         fontSize: 16.0,
//                                       ),
//                                     );
//                                   }),
//                                 ),
//                               );
//                             },
//                           );
//                         }),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 12, left: 20),
//                           child: TabBar(
//                             tabs: [
//                               Tab(
//                                 child: Text(
//                                   'Eko - 1',
//                                   style: GoogleFonts.openSans(
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ),
//                               Tab(
//                                 child: Text(
//                                   'Eko - 2',
//                                   style: GoogleFonts.openSans(
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ),
//                               Tab(
//                                 child: Text(
//                                   'Eko - 3',
//                                   style: GoogleFonts.openSans(
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ),
//                               Tab(
//                                 child: Text(
//                                   'Eko - 4',
//                                   style: GoogleFonts.openSans(
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ),
//                               Tab(
//                                 child: Text(
//                                   'Eko - 5',
//                                   style: GoogleFonts.openSans(
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 30),
//                         Container(
//                           padding: EdgeInsets.only(left: 75),
//                           child: Row(
//                             children: [
//                               SizedBox(width: 20), // Jarak sebelum huruf A
//                               Container(
//                                 width: 20,
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   'A',
//                                   style: TextStyle(fontSize: 14),
//                                 ),
//                               ),
//                               // Jarak antara huruf A dan B
//                               Container(
//                                 width: 60,
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   'B',
//                                   style: TextStyle(fontSize: 14),
//                                 ),
//                               ),
//                               // Jarak antara huruf B dan C
//                               Container(
//                                 width: 30,
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   'C',
//                                   style: TextStyle(fontSize: 14),
//                                 ),
//                               ),
//                               SizedBox(width: 70), // Jarak antara huruf C dan D
//                               Container(
//                                 width: 60,
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   'D',
//                                   style: TextStyle(fontSize: 14),
//                                 ),
//                               ),
//                               SizedBox(width: 5), // Jarak antara huruf D dan E
//                               Container(
//                                 width: 20,
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   'E',
//                                   style: TextStyle(fontSize: 14),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: Container(
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         width: 60,
//                                         child: SingleChildScrollView(
//                                           scrollDirection: Axis.vertical,
//                                           child: ListView.separated(
//                                             physics:
//                                                 const NeverScrollableScrollPhysics(),
//                                             shrinkWrap: true,
//                                             separatorBuilder:
//                                                 (context, index) =>
//                                                     const SizedBox(
//                                               height: 0,
//                                             ),
//                                             itemCount: (controller
//                                                         .gerbong[controller
//                                                             .indexGerbong.value]
//                                                         .length /
//                                                     7)
//                                                 .ceil(),
//                                             itemBuilder: (context, index) {
//                                               return Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     bottom: 1),
//                                                 child: Container(
//                                                   height: 43,
//                                                   alignment:
//                                                       Alignment.centerRight,
//                                                   child: Text(
//                                                     "${index + 1}",
//                                                     style:
//                                                         TextStyle(fontSize: 14),
//                                                   ),
//                                                 ),
//                                               );
//                                             },
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(width: 10),
//                                 Expanded(
//                                   child: Container(
//                                     width: 100,
//                                     margin: const EdgeInsets.only(
//                                         right: 20), // Ruang kosong ke kanan
//                                     child: Obx(
//                                       () => GridView.builder(
//                                         padding: const EdgeInsets.only(
//                                             left: 20, top: 10),
//                                         gridDelegate:
//                                             const SliverGridDelegateWithFixedCrossAxisCount(
//                                           mainAxisSpacing: 10,
//                                           crossAxisSpacing: 10,
//                                           crossAxisCount: 7,
//                                         ),
//                                         itemCount: (controller
//                                                 .gerbong[controller
//                                                     .indexGerbong.value]
//                                                 .length)
//                                             .ceil(),
//                                         itemBuilder: (context, index) {
//                                           if (index % 7 == 3 ||
//                                               index % 7 == 4) {
//                                             return SizedBox(
//                                                 width:
//                                                     3); // Jarak antara 3 grid dengan 2 grid
//                                           } else {
//                                             return GestureDetector(
//                                               onTap: () =>
//                                                   controller.selectKursi(index),
//                                               child: Container(
//                                                 decoration: BoxDecoration(
//                                                   border: Border.all(
//                                                     color: Colors.black38,
//                                                   ),
//                                                   color: controller.gerbong[controller
//                                                                   .indexGerbong
//                                                                   .value][index]
//                                                               ["status"] ==
//                                                           "available"
//                                                       ? Colors.white
//                                                       : controller.gerbong[controller
//                                                                       .indexGerbong
//                                                                       .value][index]
//                                                                   ["status"] ==
//                                                               "filled"
//                                                           ? Color(0xFFFF8B2D)
//                                                           : Color(0xFF656CEE),
//                                                   borderRadius:
//                                                       BorderRadius.circular(10),
//                                                 ),
//                                               ),
//                                             );
//                                           }
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ItemStatus extends StatelessWidget {
//   ItemStatus({
//     Key? key,
//     required this.status,
//     required this.color,
//   }) : super(key: key);

//   final String status;
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           height: 25,
//           width: 25,
//           decoration: BoxDecoration(
//             color: color,
//             borderRadius: BorderRadius.circular(5),
//           ),
//         ),
//         SizedBox(width: 7),
//         Text(
//           status,
//           style: TextStyle(
//             fontSize: 18,
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:capstone_project_tripease/kai/view_model/select_seat_kai_controller.dart';
import 'package:capstone_project_tripease/kai/view_model/timer_select_seat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SelectSeatKai extends GetView<SelectSeatKaiController> {
  TimerText timerText = Get.put(TimerText());
  RxBool isDropdownKereta = false.obs;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
                                    Obx(
                                      () => Container(
                                        height: 40,
                                        width: 250,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
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
                                    const SizedBox(
                                      width: 80,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 37),
                                child: Obx(
                                  () => Text(
                                    timerText.timer.value,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Obx(
                        //   () => DropdownButtonHideUnderline(
                        //     child: DropdownButton<String>(
                        //       items: controller.stringList
                        //           .map(
                        //             (value) => DropdownMenuItem<String>(
                        //               child: Text(value),
                        //               value: value,
                        //             ),
                        //           )
                        //           .toList(),
                        //       value: controller.selectedValue[0],
                        //       onChanged: (newValue) {
                        //         controller.selectedValue[0] = newValue!;
                        //       },
                        //       isExpanded: true,
                        //     ),
                        //   ),
                        // ),
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
                                            itemCount: (controller
                                                        .gerbong[controller
                                                            .indexGerbong.value]
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
                                    margin: const EdgeInsets.only(
                                        right: 20), // Ruang kosong ke kanan
                                    child: Obx(
                                      () => GridView.builder(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 10),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 10,
                                          crossAxisCount: 7,
                                        ),
                                        itemCount: (controller
                                                .gerbong[controller
                                                    .indexGerbong.value]
                                                .length)
                                            .ceil(),
                                        itemBuilder: (context, index) {
                                          if (index % 7 == 3 ||
                                              index % 7 == 4) {
                                            return SizedBox(
                                                width:
                                                    3); // Jarak antara 3 grid dengan 2 grid
                                          } else {
                                            return GestureDetector(
                                              onTap: () =>
                                                  controller.selectKursi(index),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.black38,
                                                  ),
                                                  color: controller.gerbong[controller
                                                                  .indexGerbong
                                                                  .value][index]
                                                              ["status"] ==
                                                          "available"
                                                      ? Colors.white
                                                      : controller.gerbong[controller
                                                                      .indexGerbong
                                                                      .value][index]
                                                                  ["status"] ==
                                                              "filled"
                                                          ? Color(0xFFFF8B2D)
                                                          : Color(0xFF656CEE),
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
                                )
                              ],
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
