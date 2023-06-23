// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';

// class DateSelectionBottomSheet {
//   DateTime? checkInDate = DateTime.now();
//   DateTime? checkOutDate;
//   static final DateSelectionBottomSheet _instance = DateSelectionBottomSheet._internal();

//   factory DateSelectionBottomSheet() {
//     return _instance;
//   }

//   DateSelectionBottomSheet._internal();

//   void show(BuildContext context) {
//     final now = DateTime.now().subtract(Duration(days: 1));
//     final currentYear = now.year.toString();

//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(28),
//           topRight: Radius.circular(28),
//         ),
//       ),
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return Container(
//               decoration: const BoxDecoration(
//                 color: Color(0xFFF0F0F8),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(28),
//                   topRight: Radius.circular(28),
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 24, top: 16),
//                       child: Row(
//                         children: [
//                           Text(
//                             'Check In: ${checkInDate != null ? DateFormat('EEEE, dd MMMM', 'id_ID').format(checkInDate!) : 'Pilih tanggal'}',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 118,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 24, top: 16),
//                       child: Row(
//                         children: [
//                           Text(
//                             'Check Out: ${checkOutDate != null ? DateFormat('EEEE, dd MMMM', 'id_ID').format(checkOutDate!) : 'Pilih tanggal'}',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 118,
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Divider(
//                       color: Colors.white,
//                       thickness: 2,
//                       indent: 0,
//                       endIndent: 0,
//                     ),
//                     Container(
//                       child: TableCalendar(
//                         firstDay: now,
//                         lastDay: DateTime.utc(2030, 3, 14),
//                         onDaySelected: (selectedDay, focusedDay) {
//                           if (selectedDay.isBefore(now)) {
//                             // Invalid selection, show error message or handle accordingly
//                             return;
//                           }
//                           setState(() {
//                             if (checkInDate == null || checkOutDate != null) {
//                               checkInDate = selectedDay;
//                               checkOutDate = null;
//                             } else {
//                               if (selectedDay.isAfter(checkInDate!)) {
//                                 checkOutDate = selectedDay;
//                               } else {
//                                 checkInDate = selectedDay;
//                                 checkOutDate = null;
//                               }
//                             }
//                           });
//                         },
//                         selectedDayPredicate: (day) {
//                           if (checkInDate == null || checkOutDate == null) {
//                             return day == checkInDate || day == checkOutDate;
//                           } else {
//                             return day == checkInDate || day == checkOutDate || (day.isAfter(checkInDate!) && day.isBefore(checkOutDate!));
//                           }
//                         },
//                         calendarStyle: CalendarStyle(
//                           selectedDecoration: BoxDecoration(
//                             color: Colors.blue,
//                             shape: BoxShape.circle,
//                           ),
//                           selectedTextStyle: TextStyle(color: Colors.white),
//                           todayDecoration: BoxDecoration(
//                             color: Colors.transparent,
//                             shape: BoxShape.circle,
//                           ),
//                           todayTextStyle: TextStyle(color: Colors.black),
//                         ),
//                         focusedDay: checkInDate!,
//                         locale: 'id_ID',
//                         calendarFormat: CalendarFormat.month,
//                         headerStyle: const HeaderStyle(
//                           formatButtonTextStyle: TextStyle(color: Colors.transparent),
//                           formatButtonDecoration: BoxDecoration(color: Colors.transparent),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 252),
//                           child: TextButton(
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: Text(
//                               'Batal',
//                               style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
//                             ),
//                           ),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             // Validate selected dates and perform necessary actions
//                             if (checkInDate != null && checkOutDate != null) {
//                               // Both check-in and check-out dates are selected
//                               Navigator.of(context).pop([checkInDate, checkOutDate]);
//                             } else {
//                               // Invalid selection, show error message or handle accordingly
//                             }
//                           },
//                           child: Text(
//                             'OK',
//                             style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
