// ignore_for_file: avoid_print
import '/features_kai/view_model/station/return_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../view_model/carriage/select_seat_return_provider.dart';
import '../../view_model/station/departure_provider.dart';
import '../../view_model/station/station_provider.dart';
import '../../view_model/train/train_provider.dart';
import '../input_data/input_data_screen.dart';
import 'widgets/appbar_departure.dart';
import 'widgets/not_found_schedule.dart';

class ReturnSchedule extends StatefulWidget {
  const ReturnSchedule({super.key});

  @override
  State<ReturnSchedule> createState() => _ReturnScheduleState();
}

class _ReturnScheduleState extends State<ReturnSchedule> {
  bool val = false;
  bool isDropdownOpened = false;
  int buttonPressCount = 0;
  List<String> list2 = <String>['Tuan', 'Nyonya'];

  bool isPulang = false;

  List<String> list = <String>[
    'Harga Terendah',
    'Keberangkatan Awal',
    'Keberangkatan Akhir',
    'Kedatangan Awal',
    'Kedatangan Akhir',
    'Durasi Tercepat'
  ];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    final returnProv = Provider.of<ReturnProvider>(context, listen: false);
    final stationProv = Provider.of<StationProvider>(context, listen: false);

    var trainClass = returnProv.selectedClass;

    var originId = stationProv.getIdOrigin as int;
    var destinationId = stationProv.getIdDestination as int;

    if (trainClass == null) {
      returnProv.fetchReturns(
        stationOriginId: destinationId,
        stationDestinationId: originId,
      );
    } else {
      returnProv.fetchReturns(
        stationOriginId: destinationId,
        stationDestinationId: originId,
        trainClass: trainClass,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final departureProvider =
        Provider.of<DepartureProvider>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0XFF0080FF),
        title: const BuildAppbar(isPulangPergi: true),
      ),
      body: Consumer<ReturnProvider>(
        builder: (context, returnProv, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Consumer<StationProvider>(
                builder: (context, stationProv, child) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              _showFilterBottomSheet(context);
                            },
                            child: Container(
                              height: 40.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.tune,
                                    color: Colors.blueAccent,
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    'Filter',
                                    style: GoogleFonts.openSans(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 40.w),
                          const Text('Urut'),
                          SizedBox(width: 18.w),
                          Container(
                            height: 40.h,
                            width: 135.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.r),
                              ),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Consumer<ReturnProvider>(
                              builder: (context, returnProv, child) {
                                return DropdownButtonHideUnderline(
                                  child: DropdownButton2<ReturnSortingOption>(
                                    hint: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Pilih',
                                        style: GoogleFonts.openSans(
                                          color: Colors.grey,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ),
                                    value: returnProv.selectedSortingOption,
                                    iconStyleData: const IconStyleData(
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                      ),
                                      openMenuIcon: Icon(Icons.arrow_drop_up),
                                    ),
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    onChanged: (ReturnSortingOption? value) {
                                      returnProv
                                          .setSelectedSortingOption(value);
                                      var sortPrice =
                                          returnProv.selectedSortingOption;
                                      var originId =
                                          stationProv.getIdOrigin as int;
                                      var destinationId =
                                          stationProv.getIdDestination as int;
                                      returnProv.fetchReturns(
                                          stationOriginId: destinationId,
                                          stationDestinationId: originId,
                                          price: sortPrice ==
                                                  ReturnSortingOption.empty
                                              ? ''
                                              : sortPrice?.toStringValue());
                                    },
                                    items: const <DropdownMenuItem<
                                        ReturnSortingOption>>[
                                      DropdownMenuItem(
                                        value: ReturnSortingOption.empty,
                                        child: Text('All'),
                                      ),
                                      DropdownMenuItem(
                                        value: ReturnSortingOption.asc,
                                        child: Text('Terendah'),
                                      ),
                                      DropdownMenuItem(
                                          value: ReturnSortingOption.desc,
                                          child: Text('Tertinggi'))
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      // ini detail filter
                      Container(
                        width: double.maxFinite,
                        height: 92.h,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(210, 215, 224, 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 35.w,
                                  child: Text(
                                    'Filter',
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp),
                                  ),
                                ),
                                SizedBox(
                                  height: 32.h,
                                  width: 235.w,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Container(
                                        height: 32.h,
                                        // width: 135,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: const Color.fromRGBO(
                                                102, 178, 255, 1),
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '00.00 - 06.00 (B)',
                                            style: GoogleFonts.openSans(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Container(
                                        height: 32.h,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: const Color.fromRGBO(
                                                102, 178, 255, 1),
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '00.00 - 06.00 (B)',
                                            style: GoogleFonts.openSans(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                const Icon(
                                  Icons.close,
                                  size: 20,
                                  color: Color.fromRGBO(150, 152, 156, 1),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                SizedBox(
                                  width: 35.w,
                                  child: Text(
                                    'Urut',
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp),
                                  ),
                                ),
                                SizedBox(
                                  height: 32.h,
                                  width: 235.w,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Container(
                                        height: 32.h,
                                        // width: 135,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: const Color.fromRGBO(
                                                102, 178, 255, 1),
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Jam Keberangkatan',
                                            style: GoogleFonts.openSans(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                const Icon(
                                  Icons.close,
                                  size: 20,
                                  color: Color.fromRGBO(150, 152, 156, 1),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),

                      Divider(
                        height: 20.h,
                        thickness: 1,
                        color: const Color.fromRGBO(113, 114, 117, 1),
                      ),

                      SizedBox(
                        height: 400.h,
                        width: double.maxFinite,
                        child: returnProv.returns.isEmpty
                            ? NotFoundSchedule(
                                value1: stationProv.getNameOrigin!,
                                value2: stationProv.getNameDestination!,
                              )
                            : ListView.builder(
                                itemCount: returnProv.returns.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(1, 0, 1, 12),
                                    child: Consumer<TrainProvider>(
                                      builder: (context, trainProvider, child) {
                                        return InkWell(
                                          onTap: () {
                                            final selectedSeatsReturnProv = Provider
                                                .of<SelectedSeatsReturnProvider>(
                                                    context,
                                                    listen: false);

                                            returnProv
                                                .setSelectedDepartIndex(index);
                                            selectedSeatsReturnProv
                                                .clearSelectedSeats();
                                            debugPrint(returnProv
                                                .returns[returnProv
                                                    .selectedDepartIndex as int]
                                                .datumClass);

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return InputDataKai(
                                                      list: list2);
                                                },
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 160.h,
                                            width: double.maxFinite,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 8),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 0.2,
                                                  blurRadius: 0.5,
                                                  offset:
                                                      const Offset(0.5, 0.5),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/kai.png',
                                                      scale: 0.8,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 5.h),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      returnProv
                                                          .returns[index].name
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Rp ${returnProv.returns[index].price},-',
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Stasiun ${returnProv.returns[index].route![0].station?.origin}',
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Stasiun ${returnProv.returns[index].route![1].station?.origin}',
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      returnProv.returns[index]
                                                          .datumClass
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color
                                                                .fromRGBO(
                                                            113, 114, 117, 1),
                                                      ),
                                                    ),
                                                    returnProv.returns[index]
                                                                .status ==
                                                            'available'
                                                        ? Text(
                                                            'Tersedia',
                                                            style: GoogleFonts
                                                                .openSans(
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  Colors.green,
                                                            ),
                                                          )
                                                        : Text(
                                                            'Habis',
                                                            style: GoogleFonts
                                                                .openSans(
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      returnProv.returns[index]
                                                          .route![0].arriveTime
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 12.sp,
                                                      ),
                                                    ),
                                                    const Icon(
                                                        Icons.arrow_forward),
                                                    Text(
                                                      returnProv.returns[index]
                                                          .route![1].arriveTime
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 12.sp,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      departureProvider
                                                          .returnDate,
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 12.sp,
                                                        color: const Color
                                                                .fromRGBO(
                                                            113, 114, 117, 1),
                                                      ),
                                                    ),
                                                    Text(
                                                      returnProv.getDurationKA(
                                                          returnProv
                                                              .returns[index]
                                                              .route![0]
                                                              .arriveTime
                                                              .toString(),
                                                          returnProv
                                                              .returns[index]
                                                              .route![1]
                                                              .arriveTime
                                                              .toString()),
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 12.sp,
                                                        color: const Color
                                                                .fromRGBO(
                                                            113, 114, 117, 1),
                                                      ),
                                                    ),
                                                    Text(
                                                      departureProvider
                                                          .returnDate,
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 12.sp,
                                                        color: const Color
                                                                .fromRGBO(
                                                            113, 114, 117, 1),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 400.h,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: 45.h,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(0, 128, 255, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
              Consumer<ReturnProvider>(
                builder: (context, returnProvider, child) {
                  return Container(
                    margin: const EdgeInsets.only(top: 43),
                    padding: EdgeInsets.all(20.w),
                    decoration: const BoxDecoration(
                      color: Color(0xF9FAFBFB),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Consumer<StationProvider>(
                      builder: (context, stationProvider, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jenis Kereta Api',
                              style: GoogleFonts.openSans(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 50.h,
                                  width: 83.w,
                                  child: FilterChip(
                                    selectedColor: Colors.blueAccent,
                                    backgroundColor: returnProvider.filter1
                                        ? Colors.blueAccent
                                        : const Color(0xFFE1E4EA),
                                    showCheckmark: false,
                                    label: Text(
                                      'Ekonomi',
                                      style: GoogleFonts.openSans(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: returnProvider.filter1
                                              ? const Color(0xFFE1E4EA)
                                              : Colors.grey),
                                    ),
                                    selected: returnProvider.filter1,
                                    onSelected: (value) {
                                      returnProvider.setFilterOption1(value);
                                      var originId =
                                          stationProvider.getIdOrigin as int;
                                      var destinationId = stationProvider
                                          .getIdDestination as int;
                                      var trainClass =
                                          returnProvider.selectedClass;

                                      if (trainClass == null) {
                                        returnProvider.fetchReturns(
                                          stationOriginId: destinationId,
                                          stationDestinationId: originId,
                                        );
                                      } else {
                                        returnProvider.fetchReturns(
                                            stationOriginId: destinationId,
                                            stationDestinationId: originId,
                                            trainClass: trainClass);
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 50.h,
                                  width: 83.w,
                                  child: FilterChip(
                                    selectedColor: Colors.blueAccent,
                                    backgroundColor: returnProvider.filter2
                                        ? Colors.blueAccent
                                        : const Color(0xFFE1E4EA),
                                    showCheckmark: false,
                                    label: Text(
                                      'Bisnis',
                                      style: GoogleFonts.openSans(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: returnProvider.filter2
                                              ? const Color(0xFFE1E4EA)
                                              : Colors.grey),
                                    ),
                                    selected: returnProvider.filter2,
                                    onSelected: (value) {
                                      returnProvider.setFilterOption2(value);
                                      var originId =
                                          stationProvider.getIdOrigin as int;
                                      var destinationId = stationProvider
                                          .getIdDestination as int;
                                      var trainClass =
                                          returnProvider.selectedClass;

                                      if (trainClass == null) {
                                        returnProvider.fetchReturns(
                                          stationOriginId: destinationId,
                                          stationDestinationId: originId,
                                        );
                                      } else {
                                        returnProvider.fetchReturns(
                                            stationOriginId: destinationId,
                                            stationDestinationId: originId,
                                            trainClass: trainClass);
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 50.h,
                                  width: 83.w,
                                  child: FilterChip(
                                    selectedColor: Colors.blueAccent,
                                    backgroundColor: returnProvider.filter3
                                        ? Colors.blueAccent
                                        : const Color(0xFFE1E4EA),
                                    showCheckmark: false,
                                    label: Text(
                                      'Eksekutif',
                                      style: GoogleFonts.openSans(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: returnProvider.filter3
                                              ? const Color(0xFFE1E4EA)
                                              : Colors.grey),
                                    ),
                                    selected: returnProvider.filter3,
                                    onSelected: (value) {
                                      returnProvider.setFilterOption3(value);
                                      var originId =
                                          stationProvider.getIdOrigin as int;
                                      var destinationId = stationProvider
                                          .getIdDestination as int;
                                      var trainClass =
                                          returnProvider.selectedClass;

                                      if (trainClass == null) {
                                        returnProvider.fetchReturns(
                                          stationOriginId: destinationId,
                                          stationDestinationId: originId,
                                        );
                                      } else {
                                        returnProvider.fetchReturns(
                                            stationOriginId: destinationId,
                                            stationDestinationId: originId,
                                            trainClass: trainClass);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              'Nama Kereta Api',
                              style: GoogleFonts.openSans(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: const Color(0xFFE1E4EA)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: DropdownButton2<String>(
                                  hint: Text(
                                    'Pilih Nama Kereta Api',
                                    style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFE1E4EA),
                                    ),
                                  ),
                                  value: null,
                                  isExpanded: true,
                                  underline: Container(
                                    color: Colors.transparent,
                                  ),
                                  onChanged: (String? value) {},
                                  items: list.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: GoogleFonts.openSans(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            SizedBox(height: 30.h),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(252, 40),
                                    backgroundColor: const Color(0XFF0080FF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    padding: const EdgeInsets.fromLTRB(
                                        24, 0, 24, 0)),
                                child: Text(
                                  'Terapkan',
                                  style: GoogleFonts.openSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white, // Warna teks putih
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
