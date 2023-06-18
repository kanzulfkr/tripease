import 'package:capstone_project_tripease/features_kai/view/return.dart';
import 'package:capstone_project_tripease/features_kai/view_model/train/train_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../view_model/station/depature_provider.dart';
import '../../view_model/station/station_provider.dart';
import '../input_data/input_data_screen.dart';
import 'appbar_departure.dart';

class DepartureSchedule extends StatefulWidget {
  const DepartureSchedule({super.key});

  @override
  State<DepartureSchedule> createState() => _DepartureScheduleState();
}

class _DepartureScheduleState extends State<DepartureSchedule> {
  DateTime today = DateTime.now();
  DateTime arrivalDated = DateTime.now();
  DateTime returnDated = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;

  TextEditingController tglPergiEditingController = TextEditingController();
  TextEditingController tglKembaliEditingController = TextEditingController();
  bool val = false;
  bool isDropdownOpened = false;
  int buttonPressCount = 0;

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

  void arrivalDay() {
    tglPergiEditingController.text =
        DateFormat('dd MMMM yyyy', 'id_ID').format(arrivalDated);

    final departureProvider = Provider.of<DepartureViewModel>(context,
        listen: false); // listen false agar tidak rebuild

    departureProvider.setDepartureDate(arrivalDated);
  }

  void returnDay() {
    tglKembaliEditingController.text =
        DateFormat('dd MMMM yyyy', 'id_ID').format(returnDated);

    final departureProvider =
        Provider.of<DepartureViewModel>(context, listen: false);

    departureProvider.setReturnDate(returnDated);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final departureProvider =
        Provider.of<DepartureViewModel>(context, listen: false);

    Provider.of<StationProvider>(context, listen: false);

    tglPergiEditingController.text = departureProvider.departureDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const BuildAppbar(),
      ),
      body: Consumer<DepartureViewModel>(
        builder: (context, departureProvider, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Consumer<StationProvider>(
                builder: (context, stationsProvider, child) {
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
                          Consumer<StationProvider>(
                            builder: (context, stationProvider, child) {
                              return Container(
                                height: 40.h,
                                width: 135.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.r),
                                  ),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Consumer<DepartureViewModel>(
                                  builder: (context, departureProvider, child) {
                                    return DropdownButtonHideUnderline(
                                      child: DropdownButton2<SortingOption>(
                                        hint: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
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
                                        value: departureProvider
                                            .selectedSortingOption,
                                        iconStyleData: const IconStyleData(
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                          ),
                                          openMenuIcon:
                                              Icon(Icons.arrow_drop_up),
                                        ),
                                        isExpanded: true,
                                        underline: const SizedBox(),
                                        onChanged: (SortingOption? value) {
                                          departureProvider
                                              .setSelectedSortingOption(value);
                                          var sortPrice = departureProvider
                                              .selectedSortingOption;
                                          var originId =
                                              stationProvider.idOrigin as int;
                                          var destinationId = stationProvider
                                              .idDestination as int;
                                          departureProvider.fetchDepartures(
                                              stationOriginId: originId,
                                              stationDestinationId:
                                                  destinationId,
                                              price: sortPrice ==
                                                      SortingOption.empty
                                                  ? ''
                                                  : sortPrice?.toStringValue());
                                        },
                                        items: const <DropdownMenuItem<
                                            SortingOption>>[
                                          DropdownMenuItem(
                                            value: SortingOption.empty,
                                            child: Text('All'),
                                          ),
                                          DropdownMenuItem(
                                            value: SortingOption.asc,
                                            child: Text('Terendah'),
                                          ),
                                          DropdownMenuItem(
                                              value: SortingOption.desc,
                                              child: Text('Tertinggi'))
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          )
                        ],
                      ),
                      SizedBox(height: 12.h),
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
                      Row(
                        children: [
                          Consumer<StationProvider>(
                            builder: (context, value, child) {
                              return value.pulangPergi == false
                                  ? Container(
                                      width: 232.w,
                                      height: 68.h,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Stack(
                                                children: [
                                                  TextFormField(
                                                    readOnly: true,
                                                    controller:
                                                        tglPergiEditingController,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          'Tanggal Keberangkatan',
                                                      labelStyle:
                                                          GoogleFonts.openSans(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      border:
                                                          const OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    right: 8,
                                                    top: 8,
                                                    child: InkWell(
                                                      onTap: () {
                                                        _showDateBottomSheet();
                                                      },
                                                      child: Icon(
                                                        Icons.calendar_month,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 232.w,
                                          height: 68.h,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 16),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Stack(
                                                    children: [
                                                      TextFormField(
                                                        readOnly: true,
                                                        controller:
                                                            tglPergiEditingController,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Tanggal Keberangkatan',
                                                          labelStyle:
                                                              GoogleFonts
                                                                  .openSans(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                          border:
                                                              const OutlineInputBorder(),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        right: 8,
                                                        top: 8,
                                                        child: InkWell(
                                                          onTap: () {
                                                            _showDateBottomSheet();
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .calendar_month,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 232.h,
                                          height: 68.w,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 16),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Stack(
                                                    children: [
                                                      TextFormField(
                                                        readOnly: true,
                                                        controller:
                                                            tglKembaliEditingController,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Tanggal Kembali',
                                                          labelStyle:
                                                              GoogleFonts
                                                                  .openSans(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                          border:
                                                              const OutlineInputBorder(),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        right: 8,
                                                        top: 8,
                                                        child: InkWell(
                                                          onTap: () {
                                                            _showDateBottomSheet();
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .calendar_month,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
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
                          SizedBox(width: 10.w),
                          Consumer<StationProvider>(
                            builder: (context, stationProvider, child) {
                              return SizedBox(
                                width: 80.w,
                                height: 68.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Pulang Pergi?',
                                      style: GoogleFonts.openSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    CupertinoSwitch(
                                      activeColor: Colors.blueAccent,
                                      trackColor: Colors.grey,
                                      value:
                                          stationProvider.pulangPergi ?? false,
                                      onChanged: (newValue) {
                                        stationProvider
                                            .setPulangPergi(newValue);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      Divider(
                        height: 20.h,
                        thickness: 1,
                        color: Color.fromRGBO(113, 114, 117, 1),
                      ),
                      stationsProvider.pulangPergi == false
                          ? SizedBox(
                              height: 420.h,
                              width: double.maxFinite,
                              child: ListView.builder(
                                itemCount: departureProvider.departure.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(1, 0, 1, 12),
                                    child: Consumer<TrainProvider>(
                                      builder: (context, trainProvider, child) {
                                        return InkWell(
                                          onTap: () {
                                            // departureProvider
                                            //     .setSelectedDepartIndex(index);
                                            var trainId = departureProvider
                                                .departure[index].trainId;
                                            var classTr = departureProvider
                                                .departure[index].datumClass;
                                            var originSt = departureProvider
                                                .departure[index]
                                                .route[0]
                                                .station
                                                .name;
                                            var depatureSt = departureProvider
                                                .departure[index]
                                                .route[1]
                                                .station
                                                .name;
                                            var originStInt = departureProvider
                                                .departure[index]
                                                .route[0]
                                                .station
                                                .initial;
                                            var depatureStInt =
                                                departureProvider
                                                    .departure[index]
                                                    .route[1]
                                                    .station
                                                    .initial;
                                            var nameTr = departureProvider
                                                .departure[index].name;
                                            var arriveTm = departureProvider
                                                .departure[index]
                                                .route[0]
                                                .arriveTime;
                                            var price = departureProvider
                                                .departure[index].price;
                                            var depatureTm = departureProvider
                                                .departure[index]
                                                .route[1]
                                                .arriveTime;
                                            trainProvider.setTrainId(trainId);
                                            trainProvider.setNameTrain(nameTr);
                                            trainProvider
                                                .setStationOrigin(originSt);
                                            trainProvider
                                                .setStationDepature(depatureSt);
                                            trainProvider
                                                .setStationOriginInitial(
                                                    originStInt);
                                            trainProvider
                                                .setStationDepatureInitial(
                                                    depatureStInt);
                                            trainProvider
                                                .setClassTrain(classTr);
                                            trainProvider
                                                .setArriveTime(arriveTm);
                                            trainProvider
                                                .setDepatureTime(depatureTm);
                                            trainProvider.setPrice(price);
                                            trainProvider
                                                .setdateTime('0 j 30 m');

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const InputDataKai()),
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
                                                      departureProvider
                                                          .departure[index]
                                                          .name,
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Rp ${departureProvider.departure[index].price},-',
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
                                                      'Stasiun ${departureProvider.departure[index].route[0].station.name}',
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Stasiun ${departureProvider.departure[index].route[1].station.name}',
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
                                                      departureProvider
                                                          .departure[index]
                                                          .datumClass,
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
                                                    departureProvider
                                                                .departure[
                                                                    index]
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
                                                      departureProvider
                                                          .departure[index]
                                                          .route[0]
                                                          .arriveTime,
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 12.sp,
                                                      ),
                                                    ),
                                                    const Icon(
                                                        Icons.arrow_forward),
                                                    Text(
                                                      departureProvider
                                                          .departure[index]
                                                          .route[1]
                                                          .arriveTime,
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
                                                      tglPergiEditingController
                                                                  .text ==
                                                              ''
                                                          ? DateFormat(
                                                                  'EEEE, dd MMMM',
                                                                  'id_ID')
                                                              .format(DateTime
                                                                  .now())
                                                          : tglPergiEditingController
                                                              .text,
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 12.sp,
                                                        color: const Color
                                                                .fromRGBO(
                                                            113, 114, 117, 1),
                                                      ),
                                                    ),
                                                    Text(
                                                      '0 j 30 m',
                                                      style:
                                                          GoogleFonts.openSans(
                                                        fontSize: 12.sp,
                                                        color: const Color
                                                                .fromRGBO(
                                                            113, 114, 117, 1),
                                                      ),
                                                    ),
                                                    Text(
                                                      tglPergiEditingController
                                                                  .text ==
                                                              ''
                                                          ? DateFormat(
                                                                  'EEEE, dd MMMM',
                                                                  'id_ID')
                                                              .format(DateTime
                                                                  .now())
                                                          : tglPergiEditingController
                                                              .text,
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
                            )
                          : SizedBox(
                              height: 330.h,
                              width: double.maxFinite,
                              child: ListView.builder(
                                itemCount: departureProvider.departure.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(1, 0, 1, 12),
                                    child: InkWell(
                                      onTap: () {
                                        final stationProvider =
                                            Provider.of<StationProvider>(
                                                context,
                                                listen: false);
                                        // if (stationProvider.pulangPergi == true) {
                                        //   setState(() {
                                        //     isPulang = true;
                                        //   });
                                        // } else if (stationProvider.pulangPergi ==
                                        //     false) {
                                        //   setState(() {
                                        //     isPulang = false;
                                        //   });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ReturnPage(),
                                          ),
                                        );
                                        // }
                                      },
                                      child: Container(
                                        height: 160.h,
                                        width: double.maxFinite,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 0.2,
                                              blurRadius: 0.5,
                                              offset: const Offset(0.5, 0.5),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/kai.png',
                                                  scale: 0.8,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  departureProvider
                                                      .departure[index]
                                                      .route[0]
                                                      .station
                                                      .origin,
                                                  style: GoogleFonts.openSans(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
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
                                                  'Stasiun ${departureProvider.departure[index].route[0].station.name}',
                                                  style: GoogleFonts.openSans(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Text(
                                                  'Rp ${departureProvider.departure[index].price},-',
                                                  style: GoogleFonts.openSans(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w600,
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
                                                  departureProvider
                                                      .departure[index]
                                                      .datumClass,
                                                  style: GoogleFonts.openSans(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color.fromRGBO(
                                                        113, 114, 117, 1),
                                                  ),
                                                ),
                                                departureProvider
                                                            .departure[index]
                                                            .status ==
                                                        'available'
                                                    ? Text(
                                                        'Tersedia',
                                                        style: GoogleFonts
                                                            .openSans(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.green,
                                                        ),
                                                      )
                                                    : Text(
                                                        'Habis',
                                                        style: GoogleFonts
                                                            .openSans(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                                  departureProvider
                                                      .departure[index]
                                                      .route[0]
                                                      .arriveTime,
                                                  style: GoogleFonts.openSans(
                                                    fontSize: 12.sp,
                                                  ),
                                                ),
                                                const Icon(Icons.arrow_forward),
                                                Text(
                                                  departureProvider
                                                      .departure[index]
                                                      .route[1]
                                                      .arriveTime,
                                                  style: GoogleFonts.openSans(
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
                                                  tglPergiEditingController
                                                              .text ==
                                                          ''
                                                      ? DateFormat(
                                                              'EEEE, dd MMMM',
                                                              'id_ID')
                                                          .format(
                                                              DateTime.now())
                                                      : tglPergiEditingController
                                                          .text,
                                                  style: GoogleFonts.openSans(
                                                    fontSize: 12.sp,
                                                    color: const Color.fromRGBO(
                                                        113, 114, 117, 1),
                                                  ),
                                                ),
                                                Text(
                                                  '0 j 30 m',
                                                  style: GoogleFonts.openSans(
                                                    fontSize: 12.sp,
                                                    color: const Color.fromRGBO(
                                                        113, 114, 117, 1),
                                                  ),
                                                ),
                                                Text(
                                                  tglPergiEditingController
                                                              .text ==
                                                          ''
                                                      ? DateFormat(
                                                              'EEEE, dd MMMM',
                                                              'id_ID')
                                                          .format(
                                                              DateTime.now())
                                                      : tglPergiEditingController
                                                          .text,
                                                  style: GoogleFonts.openSans(
                                                    fontSize: 12.sp,
                                                    color: const Color.fromRGBO(
                                                        113, 114, 117, 1),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
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

  List<Widget> get _if {
    return [
      Container(
        width: 232.w,
        height: 68.h,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Padding(
          padding: EdgeInsets.only(left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    TextFormField(
                      readOnly: true,
                      controller: tglPergiEditingController,
                      decoration: InputDecoration(
                        hintText: 'Tanggal Keberangkatan',
                        labelStyle: GoogleFonts.openSans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: InkWell(
                        onTap: () {
                          _showDateBottomSheet();
                        },
                        child: Icon(
                          Icons.calendar_month,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        width: 232.h,
        height: 68.w,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Padding(
          padding: EdgeInsets.only(left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    TextFormField(
                      readOnly: true,
                      controller: tglKembaliEditingController,
                      decoration: InputDecoration(
                        hintText: 'Tanggal Kembali',
                        labelStyle: GoogleFonts.openSans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: InkWell(
                        onTap: () {
                          _showDateBottomSheet();
                        },
                        child: Icon(
                          Icons.calendar_month,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ];
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
          height: 479.h,
          width: 360.w,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: 43.h,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
              Consumer<DepartureViewModel>(
                builder: (context, departureProvider, child) {
                  return Container(
                    margin: const EdgeInsets.only(top: 43),
                    padding: const EdgeInsets.all(20),
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
                                  height: 32.h,
                                  width: 83.w,
                                  child: FilterChip(
                                    selectedColor: Colors.blueAccent,
                                    backgroundColor: departureProvider.filter1
                                        ? Colors.blueAccent
                                        : const Color(0xFFE1E4EA),
                                    showCheckmark: false,
                                    label: Text(
                                      'Ekonomi',
                                      style: GoogleFonts.openSans(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: departureProvider.filter1
                                              ? const Color(0xFFE1E4EA)
                                              : Colors.grey),
                                    ),
                                    selected: departureProvider.filter1,
                                    onSelected: (value) {
                                      departureProvider.setFilterOption1(value);
                                      var originId =
                                          stationProvider.idOrigin as int;
                                      var destinationId =
                                          stationProvider.idDestination as int;
                                      var trainClass =
                                          departureProvider.selectedClass;

                                      if (trainClass == null) {
                                        departureProvider.fetchDepartures(
                                          stationOriginId: originId,
                                          stationDestinationId: destinationId,
                                        );
                                      } else {
                                        departureProvider.fetchDepartures(
                                            stationOriginId: originId,
                                            stationDestinationId: destinationId,
                                            trainClass: trainClass);
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 32.h,
                                  width: 83.w,
                                  child: FilterChip(
                                    selectedColor: Colors.blueAccent,
                                    backgroundColor: departureProvider.filter2
                                        ? Colors.blueAccent
                                        : const Color(0xFFE1E4EA),
                                    showCheckmark: false,
                                    label: Text(
                                      'Bisnis',
                                      style: GoogleFonts.openSans(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: departureProvider.filter2
                                              ? const Color(0xFFE1E4EA)
                                              : Colors.grey),
                                    ),
                                    selected: departureProvider.filter2,
                                    onSelected: (value) {
                                      departureProvider.setFilterOption2(value);
                                      var originId =
                                          stationProvider.idOrigin as int;
                                      var destinationId =
                                          stationProvider.idDestination as int;
                                      var trainClass =
                                          departureProvider.selectedClass;

                                      if (trainClass == null) {
                                        departureProvider.fetchDepartures(
                                          stationOriginId: originId,
                                          stationDestinationId: destinationId,
                                        );
                                      } else {
                                        departureProvider.fetchDepartures(
                                            stationOriginId: originId,
                                            stationDestinationId: destinationId,
                                            trainClass: trainClass);
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 32.h,
                                  width: 83.w,
                                  child: FilterChip(
                                    selectedColor: Colors.blueAccent,
                                    backgroundColor: departureProvider.filter3
                                        ? Colors.blueAccent
                                        : const Color(0xFFE1E4EA),
                                    showCheckmark: false,
                                    label: Text(
                                      'Eksekutif',
                                      style: GoogleFonts.openSans(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: departureProvider.filter3
                                              ? const Color(0xFFE1E4EA)
                                              : Colors.grey),
                                    ),
                                    selected: departureProvider.filter3,
                                    onSelected: (value) {
                                      departureProvider.setFilterOption3(value);
                                      var originId =
                                          stationProvider.idOrigin as int;
                                      var destinationId =
                                          stationProvider.idDestination as int;
                                      var trainClass =
                                          departureProvider.selectedClass;

                                      if (trainClass == null) {
                                        departureProvider.fetchDepartures(
                                          stationOriginId: originId,
                                          stationDestinationId: destinationId,
                                        );
                                      } else {
                                        departureProvider.fetchDepartures(
                                            stationOriginId: originId,
                                            stationDestinationId: destinationId,
                                            trainClass: trainClass);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Text(
                              'Nama Kereta Api',
                              style: GoogleFonts.openSans(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
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
                                  // icon: const Icon(Icons.arrow_drop_down),
                                  // elevation: 16,
                                  isExpanded: true,
                                  underline: Container(
                                    color: Colors.transparent,
                                  ),
                                  // dropdownColor:
                                  //     Colors.grey[300], // Warna pinggiran dropdown
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
                            SizedBox(
                              height: 100.h,
                            ),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Aksi yang ingin dilakukan saat tombol ditekan
                                },
                                style: ElevatedButton.styleFrom(
                                    fixedSize:
                                        const Size(252, 40), // Ukuran tombol
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          5), // Sudut melengkung dengan jari-jari 5
                                    ),
                                    padding: const EdgeInsets.fromLTRB(24, 0,
                                        24, 0), // Padding di kiri dan kanan
                                    primary: const Color(
                                        0XFF0080FF) // Warna latar belakang biru
                                    ),
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

  void _showDateBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.r),
          topRight: Radius.circular(28.r),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.h, left: 24.w, bottom: 24),
                  child: Text(
                    'Pilih Tanggal',
                    style: GoogleFonts.openSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('EEEE, dd MMMM', 'id_ID').format(today),
                        style: GoogleFonts.openSans(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 50.w, child: const Icon(Icons.edit)),
                    ],
                  ),
                ),
                TableCalendar(
                  selectedDayPredicate: (day) {
                    return isSameDay(today, day);
                  },
                  firstDay: DateTime.utc(1900, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      today = selectedDay;
                      arrivalDated = selectedDay;
                      print(arrivalDated);
                    });
                  },
                  focusedDay: today,
                  locale: 'id_ID', // Set locale ke Indonesia
                  calendarFormat: CalendarFormat.month,
                  headerStyle: const HeaderStyle(
                    formatButtonTextStyle: TextStyle(color: Colors.transparent),
                    formatButtonDecoration:
                        BoxDecoration(color: Colors.transparent),
                  ),
                  calendarStyle: CalendarStyle(
                    isTodayHighlighted: true,
                    todayTextStyle: GoogleFonts.roboto(
                      fontSize: 14.sp,
                      color: const Color.fromRGBO(0, 128, 255, 1),
                    ),
                    selectedDecoration: const BoxDecoration(
                      color: Color.fromRGBO(0, 128, 255, 1),
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromRGBO(0, 128, 255, 1),
                        width: 2.0.w,
                      ),
                    ),
                  ),
                  onPageChanged: (focusedDay) {
                    setState(() {
                      today = focusedDay;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Batal',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        arrivalDay();
                        Navigator.of(context).pop();
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
            );
          },
        );
      },
    );
  }
}
