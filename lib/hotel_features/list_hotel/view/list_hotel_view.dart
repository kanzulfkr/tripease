import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../detail_hotel/view/detail_hotel_view.dart';

import '../../filter_bottomsheet/view/sheet.dart';

import '../../hotel_home/model/hotel_home_model.dart';

import '../../hotel_home/viewmodel/search_hotel_provider.dart';
import '../../hotel_search/view/hotel_search_view.dart';
import '../viewmodel/list_hotel_viewmodel.dart';

class ListHotelView extends StatefulWidget {
  const ListHotelView({Key? key}) : super(key: key);

  @override
  State<ListHotelView> createState() => _ListHotelViewState();
}

class _ListHotelViewState extends State<ListHotelView> {
  DateTime? checkInDate = DateTime.now();
  DateTime? checkOutDate;
  final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');

  void _showDateBottomSheet(BuildContext context) {
    final now = DateTime.now().subtract(const Duration(days: 1));
    final currentYear = now.year.toString();
    final dateProvider = Provider.of<DateProvider>(context, listen: false);
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF0F0F8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24, top: 16),
                      child: Row(
                        children: [
                          Text(
                            'Check In: ${dateProvider.checkInDate != null ? DateFormat('EEEE, dd MMMM', 'id_ID').format(dateProvider.checkInDate!) : 'Pilih tanggal'}',
                            style: GoogleFonts.openSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 118,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, top: 16),
                      child: Row(
                        children: [
                          Text(
                            'Check Out: ${dateProvider.checkOutDate != null ? DateFormat('EEEE, dd MMMM', 'id_ID').format(dateProvider.checkOutDate!) : 'Pilih tanggal'}',
                            style: GoogleFonts.openSans(
                              fontSize: 16,
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
                          padding: const EdgeInsets.only(left: 252),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Batal',
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500, fontSize: 14),
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
                                fontWeight: FontWeight.w500, fontSize: 14),
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

  // final ListHotelViewModel _viewModel = ListHotelViewModel();
  final PopUpViewModel _vModel = PopUpViewModel();
  SfRangeValues _values = SfRangeValues(0, 10000000);
  late TextEditingController _minValueController =
      TextEditingController(text: _values.start.toStringAsFixed(0));
  late TextEditingController _maxValueController =
      TextEditingController(text: _values.end.toStringAsFixed(0));
  double _rating = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel'),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.edit_square),
        //     onPressed: () {
        //       showDialog(
        //         context: context,
        //         builder: (BuildContext context) {
        //           return AlertDialog(
        //             content: Padding(
        //               padding: EdgeInsets.only(
        //                   left: 20.sp, right: 20.sp, top: 20.sp),
        //               child: Column(
        //                 mainAxisSize: MainAxisSize.min,
        //                 children: [
        //                   Align(
        //                     alignment: Alignment.centerLeft,
        //                     child: Column(
        //                       children: [
        //                         Text(
        //                           'Lokasi',
        //                           style: TextStyle(
        //                             fontFamily: 'Open Sans',
        //                             fontWeight: FontWeight.w600,
        //                             fontSize: 16.sp,
        //                             letterSpacing: 0.25.sp,
        //                           ),
        //                         ),
        //                         SizedBox(height: 12.h),
        //                       ],
        //                     ),
        //                   ),
        //                   Row(
        //                     children: [
        //                       const Icon(Icons.location_on),
        //                       SizedBox(width: 8.h),
        //                       Expanded(
        //                         child: ElevatedButton(
        //                           style: ButtonStyle(
        //                             backgroundColor:
        //                                 MaterialStateProperty.all<Color>(
        //                                     Colors.white),
        //                             shape: MaterialStateProperty.all<
        //                                 RoundedRectangleBorder>(
        //                               RoundedRectangleBorder(
        //                                 borderRadius:
        //                                     BorderRadius.circular(5.0.r),
        //                                 side: const BorderSide(
        //                                     color: Colors.grey),
        //                               ),
        //                             ),
        //                           ),
        //                           onPressed: () {
        //                             Navigator.push(
        //                               context,
        //                               MaterialPageRoute(
        //                                 builder: (context) =>
        //                                     const HotelSearchView(),
        //                               ),
        //                             );
        //                           },
        //                           child: Padding(
        //                             padding:
        //                                 EdgeInsets.symmetric(vertical: 12.0.sp),
        //                             child: Text(
        //                               'Medan',
        //                               style: TextStyle(
        //                                 color: Colors.grey,
        //                                 fontSize: 16.sp,
        //                               ),
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                       SizedBox(width: 8.w),
        //                       const Icon(Icons.my_location),
        //                     ],
        //                   ),
        //                   SizedBox(
        //                     height: 26.h,
        //                   ),
        //                   Column(
        //                     children: [
        //                       Align(
        //                         alignment: Alignment.centerLeft,
        //                         child: Column(
        //                           children: [
        //                             Text(
        //                               'Tanggal',
        //                               style: TextStyle(
        //                                 fontFamily: 'Open Sans',
        //                                 fontWeight: FontWeight.w600,
        //                                 fontSize: 16.sp,
        //                                 letterSpacing: 0.25,
        //                               ),
        //                             ),
        //                             SizedBox(height: 12.h),
        //                           ],
        //                         ),
        //                       ),
        //                       Row(
        //                         children: [
        //                           Expanded(
        //                             child: GestureDetector(
        //                               onTap: () {
        //                                 _showDateBottomSheet(context);
        //                               },
        //                               child: Container(
        //                                 padding: EdgeInsets.only(left: 16.sp),
        //                                 decoration: BoxDecoration(
        //                                   borderRadius:
        //                                       BorderRadius.circular(10.0),
        //                                   border: Border.all(),
        //                                 ),
        //                                 child: Row(
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.spaceBetween,
        //                                   children: [
        //                                     Padding(
        //                                       padding: EdgeInsets.symmetric(
        //                                           vertical: 8.0.sp),
        //                                       child: Text(
        //                                         checkInDate != null &&
        //                                                 checkOutDate != null
        //                                             ? '${DateFormat('dd MMMM yyyy', 'id_ID').format(checkInDate!)} - ${DateFormat('dd MMMM yyyy', 'id_ID').format(checkOutDate!)}'
        //                                             : '${DateFormat('dd MMMM yyyy', 'id_ID').format(DateTime.now())} - ${DateFormat('dd MMMM yyyy', 'id_ID').format(DateTime.now().add(const Duration(days: 1)))}',
        //                                         style: GoogleFonts.openSans(
        //                                             fontSize: 14.0,
        //                                             color: Colors.grey,
        //                                             fontWeight:
        //                                                 FontWeight.w400),
        //                                       ),
        //                                     ),
        //                                     IconButton(
        //                                       icon: SizedBox(
        //                                         width: 14.w,
        //                                         height: 16.h,
        //                                         child: const Icon(
        //                                           Icons.calendar_month,
        //                                           color: Colors.grey,
        //                                         ),
        //                                       ),
        //                                       onPressed: () {
        //                                         _showDateBottomSheet(context);
        //                                       },
        //                                     ),
        //                                   ],
        //                                 ),
        //                               ),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(height: 36.h),
        //                       Column(
        //                         children: [
        //                           Row(
        //                             mainAxisAlignment: MainAxisAlignment.center,
        //                             children: [
        //                               const Text('Jumlah Kamar'),
        //                               SizedBox(width: 10.w),
        //                               Flexible(
        //                                 child: Container(
        //                                   decoration: BoxDecoration(
        //                                     borderRadius:
        //                                         BorderRadius.circular(10.0),
        //                                     border: Border.all(
        //                                         color: Colors.grey, width: 1.0),
        //                                   ),
        //                                   child: TextFormField(
        //                                     keyboardType: TextInputType.number,
        //                                     textAlign: TextAlign.center,
        //                                     decoration: InputDecoration(
        //                                       border: InputBorder.none,
        //                                       contentPadding:
        //                                           EdgeInsets.symmetric(
        //                                               horizontal: 10.0.h),
        //                                       hintText: '0',
        //                                     ),
        //                                     controller:
        //                                         TextEditingController(text: ''),
        //                                     onChanged: (value) {
        //                                       _vModel.roomCount =
        //                                           int.parse(value);
        //                                     },
        //                                   ),
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                           SizedBox(height: 35.h),
        //                           Column(
        //                             children: [
        //                               Row(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.center,
        //                                 children: [
        //                                   const Text('Dewasa'),
        //                                   SizedBox(width: 12.w),
        //                                   Flexible(
        //                                     child: Container(
        //                                       decoration: BoxDecoration(
        //                                         borderRadius:
        //                                             BorderRadius.circular(
        //                                                 10.0.r),
        //                                         border: Border.all(
        //                                             color: Colors.grey,
        //                                             width: 1.0),
        //                                       ),
        //                                       child: TextFormField(
        //                                         keyboardType:
        //                                             TextInputType.number,
        //                                         textAlign: TextAlign.center,
        //                                         decoration: InputDecoration(
        //                                           border: InputBorder.none,
        //                                           contentPadding:
        //                                               EdgeInsets.symmetric(
        //                                                   horizontal: 10.0.h),
        //                                           hintText: '0',
        //                                         ),
        //                                         controller:
        //                                             TextEditingController(
        //                                                 text: ''),
        //                                         onChanged: (value) {
        //                                           _vModel.adultCount =
        //                                               int.parse(value);
        //                                         },
        //                                       ),
        //                                     ),
        //                                   ),
        //                                   SizedBox(
        //                                     width: 19.w,
        //                                   ),
        //                                   const Text('Anak'),
        //                                   SizedBox(width: 12.w),
        //                                   Flexible(
        //                                     child: Container(
        //                                       decoration: BoxDecoration(
        //                                         borderRadius:
        //                                             BorderRadius.circular(
        //                                                 10.0.r),
        //                                         border: Border.all(
        //                                             color: Colors.grey,
        //                                             width: 1.0.w),
        //                                       ),
        //                                       child: TextFormField(
        //                                         keyboardType:
        //                                             TextInputType.number,
        //                                         textAlign: TextAlign.center,
        //                                         decoration: InputDecoration(
        //                                           border: InputBorder.none,
        //                                           contentPadding:
        //                                               EdgeInsets.symmetric(
        //                                                   horizontal: 10.0.sp),
        //                                           hintText: '0',
        //                                         ),
        //                                         controller:
        //                                             TextEditingController(
        //                                                 text: ''),
        //                                         onChanged: (value) {
        //                                           _vModel.childCount =
        //                                               int.parse(value);
        //                                         },
        //                                       ),
        //                                     ),
        //                                   ),
        //                                 ],
        //                               ),
        //                               SizedBox(
        //                                 height: 20.h,
        //                               ),
        //                               Row(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.center,
        //                                 children: [
        //                                   Expanded(
        //                                     child: ElevatedButton(
        //                                       onPressed: () {
        //                                         Navigator.pop(context);
        //                                       },
        //                                       child: const Text('Perbarui'),
        //                                     ),
        //                                   )
        //                                 ],
        //                               ),
        //                             ],
        //                           )
        //                         ],
        //                       )
        //                     ],
        //                   )
        //                 ],
        //               ),
        //             ),
        //           );
        //         },
        //       );
        //     },
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            children: [
              SizedBox(height: 12.h),
              SizedBox(
                height: 52.h,
                child: Row(
                  children: [
                    SizedBox(height: 12.h),
                    Container(
                      padding: const EdgeInsets.symmetric(),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF0080FF),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return const CustomBottomSheet();
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.white,
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.tune,
                                    color: Color(0xFF0080FF)),
                                SizedBox(width: 10.w),
                                Text(
                                  'Filter',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp,
                                    letterSpacing: 0.0125,
                                    color: const Color(0xFF0080FF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 35.w),
                    Text(
                      'Urut',
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        letterSpacing: 0.0125,
                      ),
                    ),
                    SizedBox(width: 38.w),
                    Container(
                      padding:
                          EdgeInsets.fromLTRB(16.sp, 10.5.sp, 16.sp, 10.5.sp),
                      width: 121.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      child: Consumer<SearchProvider>(
                        builder: (context, searchProvider, child) {
                          return DropdownButton2<SortingOptions>(
                            value: searchProvider.selectedSortingOption,
                            hint: const Text('Pilih'),
                            isExpanded: true,
                            onChanged: (SortingOptions? newValue) {
                              searchProvider.setSelectedSortingOption(newValue);
                              var sortPrice =
                                  searchProvider.selectedSortingOption;
                              if (searchProvider.address != null) {
                                searchProvider.searchHotel(
                                    address: searchProvider.address,
                                    sortByPrice:
                                        sortPrice == SortingOptions.empty
                                            ? ''
                                            : sortPrice?.toStringValue());
                                debugPrint(
                                    'PAnjang : ${searchProvider.hotel.length}');
                              } else if (searchProvider.values.start != null &&
                                  searchProvider.values.end != null) {
                                searchProvider.searchHotel(
                                    minimumPrice:
                                        searchProvider.values.start.truncate(),
                                    maximumPrice:
                                        searchProvider.values.end.truncate(),
                                    sortByPrice:
                                        sortPrice == SortingOptions.empty
                                            ? ''
                                            : sortPrice?.toStringValue());
                                debugPrint(
                                    'PAnjang : ${searchProvider.hotel.length}');
                                // debugPrint(
                                //     'Data harga: ${searchHotel.hotel[0].hotelRoomStart ?? 'No data'}');
                              } else if (searchProvider.ratinglass != 0 &&
                                  searchProvider.hotel != []) {
                                searchProvider.searchHotel(
                                    ratingClass: searchProvider.ratinglass,
                                    sortByPrice:
                                        sortPrice == SortingOptions.empty
                                            ? ''
                                            : sortPrice?.toStringValue());
                                debugPrint(
                                    'PAnjang : ${searchProvider.hotel.length}');
                              } else if (searchProvider.address != null &&
                                  searchProvider.values.start != null &&
                                  searchProvider.values.end != null) {
                                searchProvider.searchHotel(
                                    minimumPrice:
                                        searchProvider.values.start.truncate(),
                                    maximumPrice:
                                        searchProvider.values.end.truncate(),
                                    address: searchProvider.address,
                                    sortByPrice:
                                        sortPrice == SortingOptions.empty
                                            ? ''
                                            : sortPrice?.toStringValue());
                                debugPrint(
                                    'PAnjang : ${searchProvider.hotel.length}');
                              } else if (searchProvider.address != null &&
                                  searchProvider.values.start != null &&
                                  searchProvider.values.end != null &&
                                  searchProvider.ratinglass != 0) {
                                searchProvider.searchHotel(
                                    minimumPrice:
                                        searchProvider.values.start.truncate(),
                                    maximumPrice:
                                        searchProvider.values.end.truncate(),
                                    ratingClass: searchProvider.ratinglass,
                                    address: searchProvider.address,
                                    sortByPrice:
                                        sortPrice == SortingOptions.empty
                                            ? ''
                                            : sortPrice?.toStringValue());
                                debugPrint(
                                    'PAnjang : ${searchProvider.hotel.length}');
                              } else {
                                searchProvider.searchHotel(
                                    sortByPrice:
                                        sortPrice == SortingOptions.empty
                                            ? ''
                                            : sortPrice?.toStringValue());
                                debugPrint(
                                    'PAnjang : ${searchProvider.hotelFiltered.length}');
                              }
                              // Function
                            },
                            items: <DropdownMenuItem<SortingOptions>>[
                              DropdownMenuItem<SortingOptions>(
                                  value: SortingOptions.empty,
                                  child: Container(
                                      width: double.infinity,
                                      child: Text('Pilih'))),
                              DropdownMenuItem<SortingOptions>(
                                value: SortingOptions.recommended,
                                child: Container(
                                    width: double.infinity,
                                    child: Text('Rekomendasi')),
                              ),
                              DropdownMenuItem<SortingOptions>(
                                value: SortingOptions.asc,
                                child: Container(
                                    width: double.infinity,
                                    child: Text('Harga Terendah')),
                              ),
                              DropdownMenuItem<SortingOptions>(
                                value: SortingOptions.desc,
                                child: Container(
                                    width: double.infinity,
                                    child: Text('Harga Tertinggi')),
                              ),
                              DropdownMenuItem<SortingOptions>(
                                value: SortingOptions.rating,
                                child: Container(
                                    width: double.infinity,
                                    child: Text('Kelas Hotel')),
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Consumer<SearchProvider>(
                builder: (context, searchProvider, child) {
                  debugPrint(
                      'PAnjang : ${searchProvider.hotelFiltered.length}');
                  return SizedBox(
                    height: 575.h,
                    child: ListView.builder(
                      itemCount: searchProvider.hotel.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            searchProvider.setSelectedHotelIndex(index);
                            debugPrint(
                                'NAMA HOTEL : ${searchProvider.hotel[searchProvider.selectedHotelIndex as int].name}');

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetailView(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 12.sp),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 190.w,
                                    padding: EdgeInsets.only(
                                        left: 16.sp, top: 16.sp, right: 16.sp),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: Colors.white,
                                          width: 1.w,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          index >= 0 &&
                                                  index <
                                                      searchProvider
                                                          .hotel.length
                                              ? searchProvider.hotel[index].name
                                                  .toString()
                                              : 'Invalid Index',
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.sp,
                                            letterSpacing: 0.04,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.location_on),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    searchProvider
                                                        .hotel[index].address
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontFamily: 'Open Sans',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 10.sp,
                                                      letterSpacing: 0.015,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 7.h,
                                        ),
                                        RatingBarIndicator(
                                          itemBuilder: (context, index) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          rating: searchProvider
                                              .hotel[index].datumClass!
                                              .toDouble(),
                                          itemCount: searchProvider
                                              .hotel[index].datumClass!,
                                          itemSize: 12.0,
                                          direction: Axis.horizontal,
                                        ),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        Text(
                                          ' ${formatter.format(searchProvider.hotel[index].hotelRoomStart!)}',
                                          style: TextStyle(
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                            letterSpacing: 0.04,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        // Text(
                                        //   'Rp. ${hotel.discPrice!}',
                                        //   style: TextStyle(
                                        //       fontFamily: 'Open Sans',
                                        //       fontWeight: FontWeight.w400,
                                        //       fontSize: 12,
                                        //       letterSpacing: 0.04,
                                        //       color: Colors.orange),
                                        // ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    height: 150.h,
                                    width: 141.h,
                                    child: searchProvider.hotel.isNotEmpty &&
                                            searchProvider
                                                    .hotel[index].hotelImage !=
                                                null &&
                                            searchProvider.hotel[index]
                                                .hotelImage!.isNotEmpty &&
                                            searchProvider.hotel[index]
                                                    .hotelImage![0].imageUrl !=
                                                null &&
                                            searchProvider.hotel[index]
                                                    .hotelImage![0].imageUrl !=
                                                "h.png" &&
                                            searchProvider.hotel[index]
                                                    .hotelImage![0].imageUrl !=
                                                "string" &&
                                            searchProvider.hotel[index]
                                                    .hotelImage![0].imageUrl !=
                                                "c.jpg"
                                        ? Image.network(
                                            searchProvider.hotel[index]
                                                .hotelImage![0].imageUrl!,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            'assets/images/hotel1.jpeg',
                                            fit: BoxFit.fill),
                                  ),
                                  // Container(
                                  //   height: 150.h,
                                  //   width: 141.h,
                                  //   decoration: BoxDecoration(
                                  //     image: DecorationImage(
                                  //       image: NetworkImage(
                                  //         searchProvider.hotel[index].hotelImage![0].imageUrl!,
                                  //       ),
                                  //       fit: BoxFit.cover,
                                  //     ),
                                  //   ),
                                  //
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
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
