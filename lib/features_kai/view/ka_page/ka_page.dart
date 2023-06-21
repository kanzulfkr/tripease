import 'package:capstone_project_tripease/features_kai/view/ka_page/search_page.dart';
import 'package:capstone_project_tripease/features_kai/view_model/order_ticket/order_train_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'not_found_station.dart';
import '../../view_model/station/departure_provider.dart';
import '../../view_model/station/station_provider.dart';
import '../train_schedule/departure_schedule.dart';

class KaPage extends StatefulWidget {
  const KaPage({Key? key}) : super(key: key);

  @override
  State<KaPage> createState() => _KaPageState();
}

class _KaPageState extends State<KaPage> {
  List<String> dropdownItems = [
    '',
    'Ekonomi',
    'Bisnis',
    'Eksekutif',
  ];
  List<String> cities = [
    'BD',
    'GMR',
    'SMC',
    'SMT',
    'MDN',
    'BNJ',
  ];
  List<String> cities2 = [
    'Bandung',
    'Gambir',
    'Semarang Poncol',
    'Semarang Tawang',
    'Medan',
    'Binjai',
    'Jakarta',
  ];

  bool isDropdownOpened = false;
  double containerHeight = 474.h;

  final _formKey = GlobalKey<FormState>();

  TextEditingController asalController = TextEditingController();
  TextEditingController tujuanController = TextEditingController();
  TextEditingController tglPergiController = TextEditingController();
  TextEditingController tglKembaliController = TextEditingController();
  TextEditingController dewasaController = TextEditingController();
  TextEditingController anakAnakController = TextEditingController();
  TextEditingController jenisKAController = TextEditingController();
  TextEditingController _searchController = TextEditingController();

  // String? selectedValue;
  DateTime today = DateTime.now();
  DateTime arrivalDated = DateTime.now();
  DateTime returnDated = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;

  bool isSwitch = false;

  void arrivalDay() {
    tglPergiController.text =
        DateFormat('dd MMMM yyyy', 'id_ID').format(arrivalDated);
    final departureProvider =
        Provider.of<DepartureProvider>(context, listen: false);
    departureProvider.setDepartureDate(arrivalDated);
  }

  void returnDay() {
    tglKembaliController.text =
        DateFormat('dd MMMM yyyy', 'id_ID').format(returnDated);
    final departureProvider =
        Provider.of<DepartureProvider>(context, listen: false);
    departureProvider.setReturnDate(returnDated);
  }

  @override
  void initState() {
    super.initState();
    // Future.microtask(() =>
    //     Provider.of<StationProvider>(context, listen: false).getStation());
  }

  void _switchValue() {
    String temp = asalController.text;
    asalController.text = tujuanController.text;
    tujuanController.text = temp;

    final stationProv = Provider.of<StationProvider>(context, listen: false);
    final departureProv =
        Provider.of<DepartureProvider>(context, listen: false);

    stationProv.switchStations();
    departureProv.clearDeparture();

    print('origin baru ${stationProv.getIdOrigin}');
    print('destination baru ${stationProv.getIdDestination}');
  }

  @override
  void dispose() {
    asalController;
    tujuanController;
    tglPergiController;
    tglKembaliController;
    dewasaController;
    anakAnakController;
    jenisKAController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 128, 255, 1),
        title: Text(
          'Kereta Api',
          style: GoogleFonts.openSans(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.transparent,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Consumer<StationProvider>(builder: (context, stationProv, _) {
      return Form(
        key: _formKey,
        child: Container(
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
          child: Consumer<PostOrderTrainProvider>(
            builder: (context, postOrder, child) {
              return ListView(
                children: [
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.all(20.w),
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Asal',
                          style: GoogleFonts.openSans(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50.h,
                              child: SvgPicture.asset(
                                'assets/icons/location_on.svg',
                                width: 24.w,
                                height: 24.h,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 12.w, bottom: 10.h),
                              width: 200.w,
                              child: TextFormField(
                                readOnly: true,
                                controller: stationProv.asalController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                style: GoogleFonts.openSans(
                                    fontSize: 14.sp.sp, color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: 'Medan (MDN)',
                                  hintStyle:
                                      GoogleFonts.openSans(color: Colors.grey),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 10.h),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromRGBO(210, 215, 224, 1)),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Stasiun asal harap di isi.';
                                  }
                                  return null;
                                },
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SearchPage(isOrigin: true),
                                    ),
                                  );
                                  // _showCariBottomSheet(
                                  //     context, stationProvider);
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tujuan',
                              style: GoogleFonts.openSans(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _switchValue();
                                  });
                                },
                                child: SvgPicture.asset(
                                    'assets/icons/swap_vert.svg')),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50.h,
                              child: SvgPicture.asset(
                                'assets/icons/location_on.svg',
                                width: 24.w,
                                height: 24.h,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 12.w, bottom: 10.h),
                              width: 200.w,
                              child: TextFormField(
                                readOnly: true,
                                controller: stationProv.tujuanController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.text,
                                style: GoogleFonts.openSans(
                                    fontSize: 14.sp.sp, color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: 'Binjai (BJN)',
                                  hintStyle:
                                      GoogleFonts.openSans(color: Colors.grey),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 10.h),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromRGBO(210, 215, 224, 1)),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Stasiun tujuan harap di isi.';
                                  }
                                  return null;
                                },
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SearchPage(isOrigin: false),
                                    ),
                                  );
                                  // _showCariBottomSheet2(
                                  //     context, stationProvider);
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Consumer<StationProvider>(
                              builder: (context, stationProvider, child) {
                                return stationProvider.pulangPergi == false
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Tanggal Keberangkatan',
                                            style: GoogleFonts.openSans(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 8.h),
                                            width: 177.w,
                                            child: TextFormField(
                                              maxLines: 1,
                                              readOnly: true,
                                              controller: tglPergiController,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              style: GoogleFonts.openSans(
                                                  fontSize: 14.sp.sp,
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                hintText: 'Pilih Tanggal',
                                                hintStyle: GoogleFonts.openSans(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0x96989C9C),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 16.w,
                                                        vertical: 10.h),
                                                border: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      width: 1,
                                                      color: Color.fromRGBO(
                                                          210, 215, 224, 1)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                ),
                                                suffixIcon: SizedBox(
                                                  width: 48.w,
                                                  height: 48.h,
                                                  child: InkWell(
                                                    onTap: () {
                                                      _arrivalDateBottomSheet();
                                                    },
                                                    child: const Icon(
                                                      Icons.calendar_month,
                                                      color: Color.fromARGB(
                                                          167, 118, 122, 122),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              onChanged: (value) {
                                                postOrder.setArrivalTime(value);
                                              },
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Harap diisi';
                                                }
                                                return null;
                                              },
                                            ),
                                          )
                                        ],
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Tanggal Keberangkatan',
                                            style: GoogleFonts.openSans(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 8.h),
                                            width: 177.w,
                                            child: TextFormField(
                                              maxLines: 1,
                                              readOnly: true,
                                              controller: tglPergiController,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              style: GoogleFonts.openSans(
                                                  fontSize: 14.sp.sp,
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                hintText: 'Pilih Tanggal',
                                                hintStyle: GoogleFonts.openSans(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      const Color(0x96989C9C),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 16.w,
                                                        vertical: 10.h),
                                                border: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      width: 1,
                                                      color: Color.fromRGBO(
                                                          210, 215, 224, 1)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                ),
                                                suffixIcon: SizedBox(
                                                  width: 48.w,
                                                  height: 48.h,
                                                  child: InkWell(
                                                    onTap: () {
                                                      _arrivalDateBottomSheet();
                                                    },
                                                    child: const Icon(
                                                      Icons.calendar_month,
                                                      color: Color.fromARGB(
                                                          167, 118, 122, 122),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              onChanged: (value) {
                                                postOrder.setArrivalTime(value);
                                              },
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Harap diisi';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 8.h),
                                                child: Text(
                                                  'Tanggal Kembali',
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 8.h),
                                                width: 177.w,
                                                child: TextFormField(
                                                  maxLines: 1,
                                                  readOnly: true,
                                                  controller:
                                                      tglKembaliController,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 14.sp.sp,
                                                      color: Colors.black),
                                                  decoration: InputDecoration(
                                                    hintText: 'Pilih Tanggal',
                                                    hintStyle:
                                                        GoogleFonts.openSans(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0x96989C9C),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16.w,
                                                            vertical: 10.h),
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 1,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      210,
                                                                      215,
                                                                      224,
                                                                      1)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.r),
                                                    ),
                                                    suffixIcon: SizedBox(
                                                      width: 48.w,
                                                      height: 48.h,
                                                      child: InkWell(
                                                        onTap: () {
                                                          _returnDateBottomSheet();
                                                        },
                                                        child: const Icon(
                                                          Icons.calendar_month,
                                                          color: Color.fromARGB(
                                                              167,
                                                              118,
                                                              122,
                                                              122),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  onChanged: (value) {
                                                    postOrder
                                                        .setDepatureTime(value);
                                                  },
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Harap diisi';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                              },
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Pulang Pergi?',
                                  style: GoogleFonts.openSans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Consumer<StationProvider>(
                                  builder: (context, stationProvider, child) {
                                    return Container(
                                      margin: EdgeInsets.only(top: 8.h),
                                      height: 45.h,
                                      child: CupertinoSwitch(
                                        activeColor: Colors.blueAccent,
                                        trackColor: Colors.grey,
                                        value: stationProvider.pulangPergi,
                                        onChanged: (newValue) {
                                          stationProvider
                                              .setPulangPergi(newValue);
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: Text(
                                'Dewasa',
                                style: GoogleFonts.openSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              // height: 44.h,
                              width: 65.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextFormField(
                                maxLines: 1,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: dewasaController,
                                keyboardType: TextInputType.number,
                                style: GoogleFonts.openSans(
                                    fontSize: 14.sp, color: Colors.black),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 26.w),
                                  hintText: '0',
                                  hintStyle:
                                      GoogleFonts.openSans(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromRGBO(210, 215, 224, 1)),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  postOrder.setQuantityInfant(
                                      int.tryParse(value) ?? 0);
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(2)
                                ],
                              ),
                            ),
                            SizedBox(
                              // height: 44.h,
                              width: 49.w,
                              child: Center(
                                child: Text(
                                  'Anak - Anak',
                                  style: GoogleFonts.openSans(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            Container(
                              // height: 44.h,
                              width: 65.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextFormField(
                                maxLines: 1,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: anakAnakController,
                                keyboardType: TextInputType.number,
                                style: GoogleFonts.openSans(
                                    fontSize: 14.sp, color: Colors.black),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 26.w),
                                  hintText: '0',
                                  hintStyle:
                                      GoogleFonts.openSans(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromRGBO(210, 215, 224, 1)),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                                onChanged: (value) {
                                  postOrder.setQuantityAdult(int.parse(value));
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(2)
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Jenis Kereta Api',
                              style: GoogleFonts.openSans(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                            Container(
                              height: 40,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.r),
                                ),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 161, 163, 165),
                                ),
                              ),
                              child: Consumer<DepartureProvider>(
                                builder: (context, departureProvider, child) {
                                  return DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      hint: TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: jenisKAController,
                                        readOnly: true,
                                        style: GoogleFonts.openSans(
                                            fontSize: 14.sp,
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          hintText: 'Pilih',
                                          hintStyle: GoogleFonts.openSans(
                                              color: Colors.grey),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                        ),
                                      ),
                                      iconStyleData: const IconStyleData(
                                        icon: Icon(Icons.arrow_drop_down),
                                        openMenuIcon: Icon(Icons.arrow_drop_up),
                                      ),
                                      isExpanded: true,
                                      underline: const SizedBox(),
                                      onChanged: (String? value) {
                                        departureProvider
                                            .setSelectedClass(value);
                                        jenisKAController.text =
                                            departureProvider.selectedClass
                                                .toString();
                                      },
                                      items: dropdownItems
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value == '' ? 'Semua' : value,
                                            style: GoogleFonts.openSans(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Consumer<DepartureProvider>(
                          builder: (context, departureProvider, child) {
                            return Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  postOrder.setQuantityInfant(
                                      int.tryParse(anakAnakController.text) ??
                                          0);
                                  print(
                                      'dewasa : ${postOrder.getQuantityAdult}');
                                  print(
                                      'anak-anak : ${postOrder.getQuantityInfant}');

                                  if (_formKey.currentState!.validate()) {
                                    var originId =
                                        stationProv.getIdOrigin as int;
                                    var destinationId =
                                        stationProv.getIdDestination as int;
                                    postOrder.setQuantityAdult(
                                        int.parse(dewasaController.text));
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
                                        trainClass: trainClass,
                                      );
                                    }
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DepartureSchedule(),
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  backgroundColor:
                                      const Color.fromRGBO(0, 128, 255, 1),
                                  minimumSize: Size(400.w, 45.h),
                                ),
                                child: Text(
                                  'Cari',
                                  style: GoogleFonts.openSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    });
  }

  Future<dynamic> _showCariBottomSheet(
      BuildContext context, StationProvider stationProvider) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xF9FAFBFB),
      builder: (context) {
        final searchResult =
            stationProvider.searchStation(stationProvider.query);
        return FractionallySizedBox(
          heightFactor: 0.9.h,
          child: ListView(
            children: [
              Container(
                height: 45.h,
                margin: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xD2D7E0E0),
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xF9FAFBFB),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Cari kota atau stasiun',
                    hintStyle: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0x96989C9C),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: const Color(0X96989C9C),
                      size: 20.sp,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: const Color(0X96989C9C),
                        size: 20.sp,
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    stationProvider.updateSearchQuery(value);
                  },
                ),
              ),
              _searchController.text == ''
                  ? NotFoundStation(
                      value: _searchController.text,
                    )
                  : Expanded(
                      child: Container(
                        height: 300,
                        width: double.maxFinite,
                        margin: EdgeInsets.only(top: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(8),
                            right: Radius.circular(8),
                          ),
                          color: const Color(0xF9FAFBFB),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: searchResult.length,
                          itemBuilder: (context, index) {
                            final station = searchResult[index];
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    stationProvider
                                        .setIdOrigin(station.stationId);
                                    stationProvider.setNameOrigin(station.name);
                                    stationProvider
                                        .setInitialOrigin(station.initial);
                                    debugPrint(station.stationId.toString());
                                    asalController.text =
                                        '${station.name}(${station.initial})';
                                    Navigator.pop(context);
                                  },
                                  child: ListTile(
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              station.initial.toString(),
                                              style: GoogleFonts.openSans(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(width: 8.h),
                                            Container(
                                              width: 5,
                                              height: 5,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(width: 8.h),
                                            Text(
                                              station.origin.toString(),
                                              style: GoogleFonts.openSans(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          station.name.toString(),
                                          style: GoogleFonts.openSans(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 4.h,
                                  thickness: 1,
                                  color: Colors.grey,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _showCariBottomSheet2(
      BuildContext context, StationProvider stationProvider) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xF9FAFBFB),
      builder: (context) {
        final searchResult =
            stationProvider.searchStation(stationProvider.query);
        return FractionallySizedBox(
          heightFactor: 0.9.h,
          child: ListView(
            children: [
              Container(
                height: 45.h,
                margin: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xD2D7E0E0),
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xF9FAFBFB),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Cari kota atau stasiun',
                    hintStyle: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0x96989C9C),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: const Color(0X96989C9C),
                      size: 20.sp,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: const Color(0X96989C9C),
                        size: 20.sp,
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    stationProvider.updateSearchQuery(value);
                  },
                ),
              ),
              _searchController.text == ''
                  ? NotFoundStation(value: _searchController.text)
                  : Expanded(
                      child: Container(
                        height: 300,
                        width: double.maxFinite,
                        margin: EdgeInsets.only(top: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(8),
                            right: Radius.circular(8),
                          ),
                          color: const Color(0xF9FAFBFB),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: searchResult.length,
                          itemBuilder: (context, index) {
                            final station = searchResult[index];
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    stationProvider
                                        .setIdDestination(station.stationId);
                                    stationProvider
                                        .setNameDestination(station.name);
                                    stationProvider
                                        .setInitialDestination(station.initial);
                                    debugPrint(station.stationId.toString());
                                    tujuanController.text =
                                        '${station.name}(${station.initial})';
                                    Navigator.pop(context);
                                  },
                                  child: ListTile(
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              station.initial.toString(),
                                              style: GoogleFonts.openSans(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(width: 8.h),
                                            Container(
                                              width: 5,
                                              height: 5,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(width: 8.h),
                                            Text(
                                              station.origin.toString(),
                                              style: GoogleFonts.openSans(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          station.name.toString(),
                                          style: GoogleFonts.openSans(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 4.h,
                                  thickness: 1,
                                  color: Colors.grey,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }

  void _arrivalDateBottomSheet() {
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
                  padding:
                      EdgeInsets.only(top: 16.sp, left: 24.sp, bottom: 24.sp),
                  child: Text(
                    'Pilih Tanggal Keberangkatan',
                    style: GoogleFonts.openSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('EEEE, dd MMMM', 'id_ID').format(today),
                        style: GoogleFonts.openSans(
                          fontSize: 14.sp,
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
                            fontWeight: FontWeight.w500, fontSize: 14.sp),
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
                            fontWeight: FontWeight.w500, fontSize: 14.sp),
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

  void _returnDateBottomSheet() {
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
                  padding:
                      EdgeInsets.only(top: 16.sp, left: 24.sp, bottom: 24.sp),
                  child: Text(
                    'Pilih Tanggal Kembali',
                    style: GoogleFonts.openSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('EEEE, dd MMMM', 'id_ID').format(today),
                        style: GoogleFonts.openSans(
                          fontSize: 14.sp,
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
                      returnDated = selectedDay;
                      print(returnDated);
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
                            fontWeight: FontWeight.w500, fontSize: 14.sp),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        returnDay();
                        Navigator.of(context).pop();
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
            );
          },
        );
      },
    );
  }
}
