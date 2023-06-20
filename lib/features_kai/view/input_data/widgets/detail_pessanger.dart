import 'package:capstone_project_tripease/features_kai/view/seat_carriage/select_seat_kai.dart';
import 'package:capstone_project_tripease/features_kai/view_model/order_ticket/order_train_provider.dart';
import 'package:capstone_project_tripease/features_kai/view_model/station/departure_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../model/order_train_model.dart';
import '../../../view_model/carriage/carriage_provider.dart';

class BodyDetailPessanger extends StatelessWidget {
  const BodyDetailPessanger({
    super.key,
    required this.list,
  });

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Consumer<PostOrderTrainProvider>(
      builder: (context, travelerDetail, child) {
        if (travelerDetail.travelerDetail == null ||
            travelerDetail.travelerDetail!.length !=
                travelerDetail.getQuantityAdult) {
          travelerDetail.travelerDetail = List.generate(
            travelerDetail.getQuantityAdult,
            (index) => TravelerDetail(),
          );
        }
        return SizedBox(
          height: 300.h,
          child: ListView.builder(
            itemCount: travelerDetail.getQuantityAdult,
            itemBuilder: (context, index) {
              final passenger = index + 1;
              final traveler = travelerDetail.travelerDetail!.length > index
                  ? travelerDetail.travelerDetail![index]
                  : TravelerDetail();

              return Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: const Color(0xF9FAFBFB),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.2,
                          blurRadius: 0.5,
                          offset: const Offset(0.5, 0.5),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Penumpang $passenger',
                                style: GoogleFonts.openSans(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  // final departureProv =
                                  //     Provider.of<DepartureProvider>(context,
                                  //         listen: false);
                                  // await Provider.of<CarriageProvider>(context,
                                  //         listen: false)
                                  //     .fetchCarriageEko(
                                  // trainId: 6
                                  // departureProv
                                  //     .departure[departureProv
                                  //         .selectedDepartIndex as int]
                                  //     .trainId as int
                                  // ,
                                  // trainClass: 'Ekonomi'
                                  //  departureProv
                                  //     .departure[departureProv
                                  //         .selectedDepartIndex as int]
                                  //     .datumClass
                                  // ,
                                  // );
                                  if (context.mounted) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SelectSeatKai(
                                          passengerNumber: passenger,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  'No.Kursi',
                                  style: GoogleFonts.openSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 48,
                            width: double.maxFinite,
                            padding: const EdgeInsets.only(left: 20, right: 30),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: DropdownButton<String>(
                              hint: const Text(
                                'Tn. / Ny.',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              value: traveler.title,
                              icon: const Icon(Icons.arrow_drop_down),
                              elevation: 16,
                              isExpanded: true,
                              underline: const SizedBox(),
                              onChanged: (String? value) {
                                traveler.title = value!;
                                travelerDetail.updateTravelerTitle(
                                    index, value);
                                print(traveler.title);
                              },
                              items: list.map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Nomor Identitas',
                            style: GoogleFonts.openSans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: TextField(
                              onChanged: (value) {
                                traveler.idCardNumber = value;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'NIK/Paspor',
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.h,
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Nama Lengkap',
                            style: GoogleFonts.openSans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: TextField(
                              onChanged: (value) {
                                traveler.fullName = value;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Nama Lengkap',
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.h,
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );

    // Consumer<PostOrderTrainProvider>(
    //   builder: (context, value, child) {
    //     return Column(
    //       children: List.generate(
    //         1,
    //         (index) {
    //           int passengerNumber = index + 1;
    //           return Column(
    //             children: [
    //               Container(
    //                 width: double.maxFinite,
    //                 decoration: BoxDecoration(
    //                   color: const Color(0xF9FAFBFB),
    //                   boxShadow: [
    //                     BoxShadow(
    //                       color: Colors.grey.withOpacity(0.5),
    //                       spreadRadius: 0.2,
    //                       blurRadius: 0.5,
    //                       offset: const Offset(0.5, 0.5),
    //                     ),
    //                   ],
    //                 ),
    //                 padding: EdgeInsets.all(12.w),
    //                 child: SingleChildScrollView(
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text(
    //                             'Penumpang $passengerNumber',
    //                             style: GoogleFonts.openSans(
    //                               fontSize: 14.sp.sp,
    //                               fontWeight: FontWeight.w600,
    //                             ),
    //                           ),
    //                           TextButton(
    //                             onPressed: () {
    //                               Navigator.push(
    //                                 context,
    //                                 MaterialPageRoute(
    //                                   builder: (context) =>
    //                                       SelectSeatKai(passengerNumber: 1),
    //                                 ),
    //                               );
    //                             },
    //                             child: Text(
    //                               'No.Kursi',
    //                               style: GoogleFonts.openSans(
    //                                 fontSize: 14.sp.sp,
    //                                 fontWeight: FontWeight.w600,
    //                                 decoration: TextDecoration.underline,
    //                                 decorationThickness: 2.0,
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(height: 8.h),
    //                       Container(
    //                         height: 48.h,
    //                         width: double.maxFinite,
    //                         padding: EdgeInsets.symmetric(horizontal: 20.h.w),
    //                         decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.all(
    //                             Radius.circular(8.r),
    //                           ),
    //                           border: Border.all(color: Colors.grey),
    //                         ),
    //                         child: DropdownButton<String>(
    //                           hint: const Text(
    //                             'Tn. / Ny.',
    //                             style: TextStyle(
    //                                 color: Colors.grey,
    //                                 fontWeight: FontWeight.w600),
    //                           ),
    //                           value: null,
    //                           icon: const Icon(Icons.arrow_drop_down),
    //                           elevation: 16,
    //                           isExpanded: true,
    //                           underline: const SizedBox(),
    //                           onChanged: (String? value) {},
    //                           items: list.map<DropdownMenuItem<String>>(
    //                               (String value) {
    //                             return DropdownMenuItem<String>(
    //                               value: value,
    //                               child: Text(
    //                                 value,
    //                                 style: TextStyle(
    //                                     fontSize: 14.sp.sp,
    //                                     fontWeight: FontWeight.w600),
    //                               ),
    //                             );
    //                           }).toList(),
    //                         ),
    //                       ),
    //                       SizedBox(height: 8.h),
    //                       Text(
    //                         'Nomor Identitas',
    //                         style: GoogleFonts.openSans(
    //                           fontSize: 14.sp.sp,
    //                           fontWeight: FontWeight.w600,
    //                         ),
    //                       ),
    //                       SizedBox(height: 8.h),
    //                       Container(
    //                         decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(8),
    //                           border: Border.all(color: Colors.grey),
    //                         ),
    //                         child: TextField(
    //                           decoration: InputDecoration(
    //                             border: InputBorder.none,
    //                             hintText: 'NIK/Paspor',
    //                             contentPadding: EdgeInsets.symmetric(
    //                                 horizontal: 16.h.w, vertical: 12.sp),
    //                           ),
    //                         ),
    //                       ),
    //                       SizedBox(height: 8.h),
    //                       Text(
    //                         'Nama Lengkap',
    //                         style: GoogleFonts.openSans(
    //                           fontSize: 14.sp.sp,
    //                           fontWeight: FontWeight.w600,
    //                         ),
    //                       ),
    //                       SizedBox(height: 8.h),
    //                       Container(
    //                         decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(8),
    //                           border: Border.all(color: Colors.grey),
    //                         ),
    //                         child: TextField(
    //                           decoration: InputDecoration(
    //                             border: InputBorder.none,
    //                             hintText: 'Nama Lengkap',
    //                             contentPadding: EdgeInsets.symmetric(
    //                                 horizontal: 16.h.w, vertical: 12.sp),
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           );
    //         },
    //       ),
    //     );
    //   },
    // );
  }
}
