// import 'package:capstone_project_tripease/kai/view/departure_schedule/departure_schedule.dart';
// import 'package:capstone_project_tripease/kai/view/input_data/input_data.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ListDeparture extends StatefulWidget {
//   const ListDeparture({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _ListDepartureState createState() => _ListDepartureState();
// }

// class _ListDepartureState extends State<ListDeparture> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 6,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.fromLTRB(1, 0, 1, 12),
//           child: InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const InputDataKai(),
//                 ),
//               );
//             },
//             child: Container(
//               height: 160.h,
//               width: double.maxFinite,
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(8),
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 0.2,
//                     blurRadius: 0.5,
//                     offset: const Offset(0.5, 0.5),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Row(
//                     children: [
//                       SvgPicture.asset(
//                         'assets/icons/logo_kai.svg',
//                         width: 24.w,
//                         height: 21.h,
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Turangga',
//                         style: GoogleFonts.openSans(
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Stasiun Bandung',
//                         style: GoogleFonts.openSans(
//                           fontSize: 12.sp,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                       Text(
//                         'Rp 5.000,-',
//                         style: GoogleFonts.openSans(
//                           fontSize: 12.sp,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Ekonomi',
//                         style: GoogleFonts.openSans(
//                           fontSize: 12.sp,
//                           fontWeight: FontWeight.w400,
//                           color: const Color.fromRGBO(113, 114, 117, 1),
//                         ),
//                       ),
//                       Text(
//                         'Tersedia',
//                         style: GoogleFonts.openSans(
//                           fontSize: 12.sp,
//                           fontWeight: FontWeight.w600,
//                           color: const Color.fromRGBO(61, 175, 29, 1),
//                         ),
//                       )
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '04.00',
//                         style: GoogleFonts.openSans(
//                           fontSize: 12.sp,
//                         ),
//                       ),
//                       const Icon(Icons.arrow_forward),
//                       Text(
//                         '04.30',
//                         style: GoogleFonts.openSans(
//                           fontSize: 12.sp,
//                         ),
//                       )
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '05 April 2023',
//                         style: GoogleFonts.openSans(
//                           fontSize: 12.sp,
//                           color: const Color.fromRGBO(113, 114, 117, 1),
//                         ),
//                       ),
//                       Text(
//                         '0 j 30 m',
//                         style: GoogleFonts.openSans(
//                           fontSize: 12.sp,
//                           color: const Color.fromRGBO(113, 114, 117, 1),
//                         ),
//                       ),
//                       Text(
//                         '05 April 2023',
//                         style: GoogleFonts.openSans(
//                           fontSize: 12.sp,
//                           color: const Color.fromRGBO(113, 114, 117, 1),
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
