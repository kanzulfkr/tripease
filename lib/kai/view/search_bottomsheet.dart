// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';

// Future<dynamic> showDateBottomSheet(BuildContext context) {
//   DateTime? selectD;
//   DateTime selectedDate = DateTime.now();
//   DateTime? selectedDated;
//   TextEditingController tglPergiEditingController = TextEditingController();
//   TextEditingController tglKembaliEditingController = TextEditingController();
//   bool val = false;
//   CalendarFormat calendarFormat = CalendarFormat.month;
//   return showModalBottomSheet(
//     context: context,
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(28),
//         topRight: Radius.circular(28),
//       ),
//     ),
//     builder: (BuildContext context) {
//       DateTime selectedDate = DateTime.now();
//       DateTime? selectedDated;

//       return StatefulBuilder(
//         builder: (BuildContext context, StateSetter setState) {
//           return Container(
//             decoration: const BoxDecoration(
//               color: Color(0xFFF0F0F8),
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(28),
//                 topRight: Radius.circular(28),
//               ),
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 24, top: 16),
//                     child: Text(
//                       'Pilih Tanggal',
//                       style: GoogleFonts.openSans(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 24, top: 36),
//                     child: Row(
//                       children: [
//                         Text(
//                           '${DateFormat('EEEE, dd MMMM', 'id_ID').format(selectedDate)}',
//                           style: GoogleFonts.openSans(
//                             fontSize: 32,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 118,
//                         ),
//                         const Icon(Icons.edit),
//                       ],
//                     ),
//                   ),
//                   const Divider(
//                     color: Colors.white,
//                     thickness: 2,
//                     indent: 0,
//                     endIndent: 0,
//                   ),
//                   Container(
//                     height: 524,
//                     width: 380,
//                     child: TableCalendar(
//                       selectedDayPredicate: (day) {
//                         return isSameDay(selectedDate, day);
//                       },
//                       firstDay: DateTime.utc(2010, 10, 16),
//                       lastDay: DateTime.utc(2030, 3, 14),
//                       onDaySelected: (selectedDay, focusedDay) {
//                         setState(() {
//                           selectedDated = selectedDay;
//                           selectedDate = selectedDay;
//                           tglPergiEditingController.text =
//                               DateFormat('EEEE, dd MMMM', 'id_ID')
//                                   .format(selectedDay);
//                           tglKembaliEditingController.text =
//                               DateFormat('EEEE, dd MMMM', 'id_ID')
//                                   .format(selectedDay);
//                         });
//                       },
//                       focusedDay: selectedDate,
//                       locale: 'id_ID', // Set locale ke Indonesia
//                       calendarFormat: CalendarFormat.month,
//                       headerStyle: const HeaderStyle(
//                         formatButtonTextStyle:
//                             TextStyle(color: Colors.transparent),
//                         formatButtonDecoration:
//                             BoxDecoration(color: Colors.transparent),
//                       ),
//                       calendarStyle: CalendarStyle(
//                         selectedDecoration: const BoxDecoration(
//                           color: Colors.lightBlueAccent,
//                           shape: BoxShape.circle,
//                         ),
//                         todayDecoration: BoxDecoration(
//                           color: Colors.transparent,
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                             color: Colors.blue,
//                             width: 2.0,
//                           ),
//                         ),
//                       ),
//                       onPageChanged: (focusedDay) {
//                         setState(() {
//                           selectedDate = focusedDay;
//                         });
//                       },
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 252),
//                         child: TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Text(
//                             'Batal',
//                             style: GoogleFonts.roboto(
//                                 fontWeight: FontWeight.w500, fontSize: 14),
//                           ),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.of(context).pop(selectedDated);
//                         },
//                         child: Text(
//                           'OK',
//                           style: GoogleFonts.roboto(
//                               fontWeight: FontWeight.w500, fontSize: 14),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       );
//     },
//   );
// }
