import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../filter_bottomsheet/view/sheet.dart';
import '../../filter_bottomsheet/viewmodel/bottomsheet_view_model.dart';
import '../../hotel_search/view/hotel_search_view.dart';
import '../../list_hotel/view/list_hotel_view.dart';
import '../model/hotel_home_model.dart';
import '../viewmodel/hotel_home_viewmodel.dart';
import '../viewmodel/search_hotel_provider.dart';

class HotelHome extends StatefulWidget {
  const HotelHome({super.key});

  @override
  HotelHomeState createState() => HotelHomeState();
}

bool isHotelSelected = false;
bool isGuestHouseSelected = false;
bool isGpSelected = false;
bool isBayarTempatSelected = false;
bool isWifiSelected = false;
bool isLoungeSelected = false;
bool isKolamRenangSelected = false;
bool isSarapanSelected = false;

class HotelHomeState extends State<HotelHome> {
  DateTime? checkInDate = DateTime.now();
  DateTime? checkOutDate;
  TextEditingController adultController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  void _showDateBottomSheet(BuildContext context) {
    final now = DateTime.now().subtract(const Duration(days: 1));
    // final currentYear = now.year.toString();
    final dateProvider = Provider.of<DateProvider>(context, listen: false);
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.r),
          topRight: Radius.circular(28.r),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28.r),
                  topRight: Radius.circular(28.r),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 24.sp, top: 16.sp),
                      child: Row(
                        children: [
                          Text(
                            'Check In: ${dateProvider.checkInDate != null ? DateFormat('EEEE, dd MMMM', 'id_ID').format(dateProvider.checkInDate!) : 'Pilih tanggal'}',
                            style: GoogleFonts.openSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 118.w,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24.sp, top: 16.sp),
                      child: Row(
                        children: [
                          Text(
                            'Check Out: ${dateProvider.checkOutDate != null ? DateFormat('EEEE, dd MMMM', 'id_ID').format(dateProvider.checkOutDate!) : 'Pilih tanggal'}',
                            style: GoogleFonts.openSans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 118,
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 2,
                      indent: 0,
                      endIndent: 0,
                    ),
                    TableCalendar(
                      firstDay: now,
                      lastDay: DateTime.utc(2030, 3, 14),
                      onDaySelected: (selectedDay, focusedDay) {
                        if (selectedDay.isBefore(now)) {
                          // Invalid selection, show error message or handle accordingly
                          return;
                        }
                        setState(() {
                          if (dateProvider.checkInDate == null ||
                              dateProvider.checkOutDate != null) {
                            dateProvider.setCheckInDate(selectedDay);
                            dateProvider.setCheckOutDate(null);
                          } else {
                            if (selectedDay
                                .isAfter(dateProvider.checkInDate!)) {
                              dateProvider.setCheckOutDate(selectedDay);
                            } else {
                              dateProvider.setCheckInDate(selectedDay);
                              dateProvider.setCheckOutDate(null);
                            }
                          }
                        });
                      },
                      selectedDayPredicate: (day) {
                        if (dateProvider.checkInDate == null ||
                            dateProvider.checkOutDate == null) {
                          return day == dateProvider.checkInDate ||
                              day == dateProvider.checkOutDate;
                        } else {
                          return day == dateProvider.checkInDate ||
                              day == dateProvider.checkOutDate ||
                              (day.isAfter(dateProvider.checkInDate!) &&
                                  day.isBefore(dateProvider.checkOutDate!));
                        }
                      },
                      calendarStyle: CalendarStyle(
                        selectedDecoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        selectedTextStyle: const TextStyle(color: Colors.white),
                        todayDecoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        todayTextStyle: const TextStyle(color: Colors.black),
                      ),
                      focusedDay: checkInDate!,
                      locale: 'id_ID',
                      calendarFormat: CalendarFormat.month,
                      headerStyle: const HeaderStyle(
                        formatButtonTextStyle:
                            TextStyle(color: Colors.transparent),
                        formatButtonDecoration:
                            BoxDecoration(color: Colors.transparent),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 252.sp),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Batal',
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500, fontSize: 14.sp),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Validate selected dates and perform necessary actions
                            if (dateProvider.checkInDate != null &&
                                dateProvider.checkOutDate != null) {
                              // Both check-in and check-out dates are selected
                              Navigator.of(context).pop([
                                dateProvider.checkInDate,
                                dateProvider.checkOutDate
                              ]);
                            } else {
                              // Invalid selection, show error message or handle accordingly
                            }
                          },
                          child: Text(
                            'OK',
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500, fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // final SfRangeValues _values = const SfRangeValues(0, 10000000);
  // late final TextEditingController _minValueController =
  //     TextEditingController(text: _values.start.toStringAsFixed(0));
  // late TextEditingController _maxValueController =
  //     TextEditingController(text: _values.end.toStringAsFixed(0));
  // double _rating = 0;
  final HotelViewModel _viewModel = HotelViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hotel',
          style: TextStyle(
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            letterSpacing: 0.05,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF66B2FF),
              Color(0xFFF9FAFB),
              Color(0xFFF9FAFB),
              Color(0xFFF9FAFB),
              Color(0xFF66B2FF),
              Color(0xFFF9FAFB),
              Color(0xFFF9FAFB),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(
              horizontal: 20.sp,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 12.h,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 0.2.w,
                    ),
                    borderRadius: BorderRadius.circular(15.0.r),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.sp, right: 20.sp, top: 20.sp),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Text(
                                'Address',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  letterSpacing: 0.25,
                                ),
                              ),
                              SizedBox(height: 12.h),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: const BorderSide(
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const FractionallySizedBox(
                                            heightFactor: 1.0,
                                            child: HotelSearchView());
                                      },
                                    );
                                  },
                                  child: Consumer<SearchProvider>(
                                    builder: (context, searchProvider, child) {
                                      return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Column(
                                                  children: [
                                                    searchProvider.address ==
                                                            null
                                                        ? Text(
                                                            'Medan',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 16.sp,
                                                            ),
                                                          )
                                                        : Text(
                                                            searchProvider
                                                                .address
                                                                .toString(),
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 16.sp,
                                                            ),
                                                            softWrap: true,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 2,
                                                          ),
                                                  ],
                                                ),
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    searchProvider
                                                        .clearAddress();
                                                  },
                                                  child: const Text('Clear'))
                                            ],
                                          ));
                                    },
                                  )),
                            ),
                            SizedBox(width: 8.w),
                            const Icon(Icons.my_location),
                          ],
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: [
                                  Text(
                                    'Tanggal',
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                      letterSpacing: 0.25,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () {
                                    _showDateBottomSheet(context);
                                  },
                                  child: Consumer<DateProvider>(
                                    builder: (context, dateProv, child) {
                                      return Form(
                                        key: formKey,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 16.sp),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0.r),
                                            border: Border.all(),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 8.0.sp),
                                                  child: dateProv.checkInDate !=
                                                              null &&
                                                          dateProv.checkOutDate !=
                                                              null
                                                      ? Text(
                                                          '${DateFormat('dd MMMM yyyy', 'id_ID').format(dateProv.checkInDate!)} - ${DateFormat('dd MMMM yyyy', 'id_ID').format(dateProv.checkOutDate!)}',
                                                        )
                                                      : TextFormField(
                                                          enabled: false,
                                                          onTap: () {
                                                            _showDateBottomSheet(
                                                                context);
                                                          },
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Tolong pilih tanggal check in dan Check out';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                'Pilih Tanggal',
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                        ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                    Icons.calendar_month),
                                                onPressed: () {
                                                  _showDateBottomSheet(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )

                                    //     GestureDetector(
                                    //   onTap: () {
                                    //     _showDateBottomSheet(context);
                                    //   },
                                    //   child: Consumer<DateProvider>(
                                    //     builder: (context, dateProv, child) {
                                    //       return Container(
                                    //         padding: EdgeInsets.only(left: 16.sp),
                                    //         decoration: BoxDecoration(
                                    //           borderRadius:
                                    //               BorderRadius.circular(10.0.r),
                                    //           border: Border.all(),
                                    //         ),
                                    //         child: Row(
                                    //           mainAxisAlignment:
                                    //               MainAxisAlignment.spaceBetween,
                                    //           children: [
                                    //             Padding(
                                    //               padding: EdgeInsets.symmetric(
                                    //                   vertical: 8.0.sp),
                                    //               child: dateProv.checkInDate !=
                                    //                           null &&
                                    //                       dateProv.checkOutDate !=
                                    //                           null
                                    //                   ? Text(
                                    //                       '${DateFormat('dd MMMM yyyy', 'id_ID').format(dateProv.checkInDate!)} - ${DateFormat('dd MMMM yyyy', 'id_ID').format(dateProv.checkOutDate!)}',
                                    //                     )
                                    //                   : Text(
                                    //                       '${DateFormat('dd MMMM yyyy', 'id_ID').format(DateTime.now())} - ${DateFormat('dd MMMM yyyy', 'id_ID').format(DateTime.now().add(const Duration(days: 1)))}'),
                                    //             ),
                                    //             IconButton(
                                    //               icon: const Icon(
                                    //                   Icons.calendar_month),
                                    //               onPressed: () {
                                    //                 _showDateBottomSheet(context);
                                    //               },
                                    //             ),
                                    //           ],
                                    //         ),
                                    //       );
                                    //     },
                                    //   ),
                                    // ),
                                    ),
                              ],
                            ),
                            SizedBox(height: 36.h),
                            Column(
                              children: [
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     const Text('Jumlah Kamar'),
                                //     SizedBox(width: 10.w),
                                //     Flexible(
                                //       child: Container(
                                //         decoration: BoxDecoration(
                                //           borderRadius:
                                //               BorderRadius.circular(10.0),
                                //           border: Border.all(
                                //               color: Colors.grey, width: 1.0),
                                //         ),
                                //         child: TextFormField(
                                //           keyboardType: TextInputType.number,
                                //           textAlign: TextAlign.center,
                                //           decoration: InputDecoration(
                                //             border: InputBorder.none,
                                //             contentPadding:
                                //                 EdgeInsets.symmetric(
                                //                     horizontal: 10.0.sp),
                                //             hintText: '0',
                                //           ),
                                //           controller:
                                //               TextEditingController(text: ''),
                                //           onChanged: (value) {
                                //             _viewModel.roomCount =
                                //                 int.parse(value);
                                //           },
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(height: 35.h),
                                Column(
                                  children: [
                                    Consumer<SearchProvider>(
                                      builder:
                                          (context, searchProvider, child) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text('Dewasa'),
                                            SizedBox(width: 12.w),
                                            Flexible(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 1.0),
                                                ),
                                                child: Form(
                                                  key: formKey2,
                                                  child: TextFormField(
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    validator: (value) {
                                                      if (value!.isEmpty ||
                                                          value == '0' ||
                                                          value == null) {
                                                        return 'Masukkan jumlah Dewasa';
                                                      }
                                                      return null;
                                                    },
                                                    keyboardType:
                                                        TextInputType.number,
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  10.0.sp),
                                                      hintText: '0',
                                                    ),
                                                    controller: adultController,
                                                    onChanged: (value) {
                                                      searchProvider
                                                          .setJumlahDewasa(
                                                              int.tryParse(
                                                                      value) ??
                                                                  0);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 19.w,
                                            ),
                                            const Text('Anak'),
                                            SizedBox(width: 12.w),
                                            Flexible(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 1.0),
                                                ),
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                10.0.sp),
                                                    hintText: '0',
                                                  ),
                                                  controller:
                                                      TextEditingController(
                                                          text: ''),
                                                  onChanged: (value) {
                                                    searchProvider.setJumlaAnak(
                                                        int.parse(value));
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 250,
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              final searchHotel =
                                                  Provider.of<SearchProvider>(
                                                      context,
                                                      listen: false);
                                              if (formKey.currentState!
                                                      .validate() &&
                                                  formKey2.currentState!
                                                      .validate()) {
                                                if (searchHotel.address !=
                                                    null) {
                                                  await searchHotel.searchHotel(
                                                      address:
                                                          searchHotel.address);
                                                  if (context.mounted) {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const ListHotelView()),
                                                    );
                                                  }
                                                } else if (searchHotel
                                                            .values.start !=
                                                        null &&
                                                    searchHotel
                                                            .values.end !=
                                                        null) {
                                                  await searchHotel.searchHotel(
                                                      minimumPrice: searchHotel
                                                          .values.start
                                                          .truncate(),
                                                      maximumPrice: searchHotel
                                                          .values.end
                                                          .truncate());
                                                  // debugPrint(
                                                  //     'Data harga: ${searchHotel.hotel[0].hotelRoomStart ?? 'No data'}');
                                                  if (context.mounted) {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const ListHotelView()),
                                                    );
                                                  }
                                                } else if (searchHotel
                                                        .ratinglass !=
                                                    0) {
                                                  await searchHotel.searchHotel(
                                                      ratingClass: searchHotel
                                                          .ratinglass);
                                                  if (context.mounted) {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const ListHotelView()),
                                                    );
                                                  }
                                                } else if (searchHotel
                                                            .address !=
                                                        null &&
                                                    searchHotel.values.start !=
                                                        null &&
                                                    searchHotel.values.end !=
                                                        null) {
                                                  await searchHotel.searchHotel(
                                                    minimumPrice: searchHotel
                                                        .values.start
                                                        .truncate(),
                                                    maximumPrice: searchHotel
                                                        .values.end
                                                        .truncate(),
                                                    address:
                                                        searchHotel.address,
                                                  );
                                                  if (context.mounted) {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const ListHotelView()),
                                                    );
                                                  }
                                                } else if (searchHotel
                                                            .address !=
                                                        null &&
                                                    searchHotel.values.start !=
                                                        null &&
                                                    searchHotel.values.end !=
                                                        null &&
                                                    searchHotel.ratinglass !=
                                                        0) {
                                                  await searchHotel.searchHotel(
                                                      minimumPrice: searchHotel
                                                          .values.start
                                                          .truncate(),
                                                      maximumPrice: searchHotel
                                                          .values.end
                                                          .truncate(),
                                                      ratingClass: searchHotel
                                                          .ratinglass,
                                                      address:
                                                          searchHotel.address);
                                                  if (context.mounted) {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const ListHotelView()),
                                                    );
                                                  }
                                                } else {
                                                  await searchHotel
                                                      .searchHotel();
                                                  if (context.mounted) {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const ListHotelView()),
                                                    );
                                                  }
                                                }
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        'Harap isi data tanggal Check In dan Check Out, serta jumlah Dewasa'),
                                                  ),
                                                );
                                              }
                                            },
                                            child: const Text('Cari'),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 16.w,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return CustomBottomSheet(); // Replace with the desired bottom sheet widget
                                                },
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                              ),
                                              backgroundColor:
                                                  const Color(0xFFF0F0F0),
                                            ),
                                            child: const Icon(Icons.tune,
                                                color: Colors.blue),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Hotel Populer',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  letterSpacing: 0.25,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: _viewModel.popularHotels
                                  .map((hotel) => Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.sp),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 150,
                                              height: 84,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.r),
                                                  topRight:
                                                      Radius.circular(4.r),
                                                  bottomLeft: Radius.zero,
                                                  bottomRight: Radius.zero,
                                                ),
                                                border: Border.all(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              child: Image.asset(hotel.image),
                                            ),
                                            Container(
                                              width: 150.w,
                                              height: 140.h,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1.0,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(8.r),
                                                  bottomRight:
                                                      Radius.circular(8.r),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 8.sp,
                                                    right: 8.sp,
                                                    top: 16.sp),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        hotel.name,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12.sp,
                                                          letterSpacing: 0.25,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 4.h),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                            Icons.location_on),
                                                        Flexible(
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                hotel.location,
                                                                softWrap: true,
                                                                overflow:
                                                                    TextOverflow
                                                                        .visible,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize:
                                                                      10.sp,
                                                                  letterSpacing:
                                                                      0.015,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 4.h,
                                                    ),
                                                    const Row(
                                                      children: [
                                                        Icon(Icons.star,
                                                            size: 16,
                                                            color:
                                                                Colors.yellow),
                                                        Icon(Icons.star,
                                                            size: 16,
                                                            color:
                                                                Colors.yellow),
                                                        Icon(Icons.star,
                                                            size: 16,
                                                            color:
                                                                Colors.yellow),
                                                        Icon(Icons.star,
                                                            size: 16,
                                                            color:
                                                                Colors.yellow),
                                                        Icon(Icons.star,
                                                            size: 16,
                                                            color:
                                                                Colors.yellow),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 4.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          hotel.price,
                                                          softWrap: true,
                                                          overflow: TextOverflow
                                                              .visible,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Open Sans',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14.sp,
                                                            letterSpacing:
                                                                0.025,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(height: 12.h),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Row(
                            children: [
                              Text(
                                'Sedang Promo',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  letterSpacing: 0.25,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: _viewModel.popularHotels
                                  .map((hotel) => Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.sp),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 150,
                                              height: 84,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4.r),
                                                  topRight:
                                                      Radius.circular(4.r),
                                                  bottomLeft: Radius.zero,
                                                  bottomRight: Radius.zero,
                                                ),
                                                border: Border.all(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              child: Image.asset(hotel.image),
                                            ),
                                            Container(
                                              width: 150,
                                              height: 140,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1.0,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(8.r),
                                                  bottomRight:
                                                      Radius.circular(8.r),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 8.sp,
                                                    right: 8.sp,
                                                    top: 16.sp),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        hotel.name,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12.sp,
                                                          letterSpacing: 0.25,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 4.h),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                            Icons.location_on),
                                                        Flexible(
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                hotel.location,
                                                                softWrap: true,
                                                                overflow:
                                                                    TextOverflow
                                                                        .visible,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Open Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize:
                                                                      10.sp,
                                                                  letterSpacing:
                                                                      0.015,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 4.h,
                                                    ),
                                                    const Row(
                                                      children: [
                                                        Icon(Icons.star,
                                                            size: 16,
                                                            color:
                                                                Colors.yellow),
                                                        Icon(Icons.star,
                                                            size: 16,
                                                            color:
                                                                Colors.yellow),
                                                        Icon(Icons.star,
                                                            size: 16,
                                                            color:
                                                                Colors.yellow),
                                                        Icon(Icons.star,
                                                            size: 16,
                                                            color:
                                                                Colors.yellow),
                                                        Icon(Icons.star,
                                                            size: 16,
                                                            color:
                                                                Colors.yellow),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 4.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          hotel.price,
                                                          softWrap: true,
                                                          overflow: TextOverflow
                                                              .visible,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Open Sans',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14.sp,
                                                            letterSpacing:
                                                                0.025,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(height: 12.h),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
