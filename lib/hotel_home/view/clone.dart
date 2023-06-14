import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_1/filter_bottomsheet/model/bottomsheet_model.dart';
import 'package:hotel_1/hotel_search/view/hotel_search_view.dart';
import 'package:hotel_1/list_hotel/view/list_hotel_view.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../filter_bottomsheet/viewmodel/bottomsheet_view_model.dart';
import '../model/hotel_home_model.dart';
import '../viewmodel/hotel_home_viewmodel.dart';


class HotelHome extends StatefulWidget {
  @override
  _HotelHomeState createState() => _HotelHomeState();
}

bool isHotelSelected = false;
bool isGuestHouseSelected = false;
bool isGpSelected = false;
bool isBayarTempatSelected = false;
bool isWifiSelected = false;
bool isLoungeSelected = false;
bool isKolamRenangSelected = false;
bool isSarapanSelected = false;

class _HotelHomeState extends State<HotelHome> {
  
  DateTime? checkInDate = DateTime.now();
  DateTime? checkOutDate;

  void _showDateBottomSheet(BuildContext context) {
    final now = DateTime.now().subtract(Duration(days: 1));
    final currentYear = now.year.toString();

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
                      child: Text(
                        currentYear,
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, top: 36),
                      child: Row(
                        children: [
                          Text(
                            'Check In: ${checkInDate != null ? DateFormat('EEEE, dd MMMM', 'id_ID').format(checkInDate!) : 'Pilih tanggal'}',
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
                            'Check Out: ${checkOutDate != null ? DateFormat('EEEE, dd MMMM', 'id_ID').format(checkOutDate!) : 'Pilih tanggal'}',
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
                    Container(
                      child: TableCalendar(
                        firstDay: now,
                        lastDay: DateTime.utc(2030, 3, 14),
                        onDaySelected: (selectedDay, focusedDay) {
                          if (selectedDay.isBefore(now)) {
                            // Invalid selection, show error message or handle accordingly
                            return;
                          }
                          setState(() {
                            if (checkInDate == null || checkOutDate != null) {
                              checkInDate = selectedDay;
                              checkOutDate = null;
                            } else {
                              if (selectedDay.isAfter(checkInDate!)) {
                                checkOutDate = selectedDay;
                              } else {                               
                                checkInDate = selectedDay;
                                checkOutDate = null;
                              }
                            }
                          });
                        },
                        selectedDayPredicate: (day) {
                          if (checkInDate == null || checkOutDate == null) {
                            return day == checkInDate || day == checkOutDate;
                          } else {
                            return day == checkInDate || day == checkOutDate || (day.isAfter(checkInDate!) && day.isBefore(checkOutDate!));
                          }
                        },
                        calendarStyle: CalendarStyle(
                          selectedDecoration: BoxDecoration(
                            color: Colors.blue, 
                            shape: BoxShape.circle,
                          ),
                          selectedTextStyle: TextStyle(color: Colors.white),
                          todayDecoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          todayTextStyle: TextStyle(color: Colors.black),
                        ),
                        focusedDay: checkInDate!,
                        locale: 'id_ID',
                        calendarFormat: CalendarFormat.month,
                        headerStyle: const HeaderStyle(
                          formatButtonTextStyle: TextStyle(color: Colors.transparent),
                          formatButtonDecoration: BoxDecoration(color: Colors.transparent),
                        ),
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
                              style: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Validate selected dates and perform necessary actions
                            if (checkInDate != null && checkOutDate != null) {
                              // Both check-in and check-out dates are selected
                              Navigator.of(context).pop([checkInDate, checkOutDate]);
                            } else {
                              // Invalid selection, show error message or handle accordingly
                            }
                          },
                          child: Text(
                            'OK',
                            style: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 14),
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

  SfRangeValues _values = SfRangeValues(0, 10000000);
  late TextEditingController _minValueController = TextEditingController(text: _values.start.toStringAsFixed(0));
  late TextEditingController _maxValueController = TextEditingController(text: _values.end.toStringAsFixed(0));
  double _rating = 0;
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
            fontSize: 16,
            letterSpacing: 0.05,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(horizontal: 20,),
          child: Column(
            children: [
              SizedBox(height: 12,),
              Container(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.2,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: const [
                              Text(
                                'Lokasi',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  letterSpacing: 0.25,
                                ),
                              ),
                              SizedBox(height: 12),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on),
                            SizedBox(width: 8),
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HotelSearchView(), // Replace with the desired page widget
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                                  child: Text(
                                    'Medan',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.my_location),
                          ],
                        ),
                        SizedBox(height: 26,),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: const [
                                  Text(
                                    'Tanggal',
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      letterSpacing: 0.25,
                                    ),
                                  ),
                                  SizedBox(height: 12),
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
                                    child: Container(
                                      padding: EdgeInsets.only(left: 16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        border: Border.all(),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(vertical: 8.0),
                                            child: Text(
                                              checkInDate != null && checkOutDate != null
                                                ? '${DateFormat('dd MMMM yyyy', 'id_ID').format(checkInDate!)} - ${DateFormat('dd MMMM yyyy', 'id_ID').format(checkOutDate!)}'
                                                : '${DateFormat('dd MMMM yyyy', 'id_ID').format(DateTime.now())} - ${DateFormat('dd MMMM yyyy', 'id_ID').format(DateTime.now().add(Duration(days: 1)))}',
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.calendar_month),
                                            onPressed: () {
                                              _showDateBottomSheet(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 36),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Jumlah Kamar'),
                                    SizedBox(width: 10),
                                    Flexible(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          border: Border.all(color: Colors.grey, width: 1.0),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                            hintText: '0',
                                          ),
                                          controller: TextEditingController(text: ''),
                                          onChanged: (value) {
                                            _viewModel.roomCount = int.parse(value);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 35),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Dewasa'),
                                        SizedBox(width: 12),
                                        Flexible(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),
                                              border: Border.all(color: Colors.grey, width: 1.0),
                                            ),
                                            child: TextFormField(
                                              keyboardType: TextInputType.number,
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                                hintText: '0',
                                              ),
                                              controller: TextEditingController(text: ''),
                                              onChanged: (value) {
                                                _viewModel.adultCount = int.parse(value);
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 19,),
                                        Text('Anak'),
                                        SizedBox(width: 12),
                                        Flexible(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),
                                              border: Border.all(color: Colors.grey, width: 1.0),
                                            ),
                                            child: TextFormField(
                                              keyboardType: TextInputType.number,
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                                                hintText: '0',
                                              ),
                                              controller: TextEditingController(text: ''),
                                              onChanged: (value) {
                                                _viewModel.childCount = int.parse(value);
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 250,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => ListHotelView()),
                                              );
                                            },
                                            child: Text('Cari'),
                                          ),
                                        ),
                                        SizedBox(width: 16,),
                                        ElevatedButton(
                                          onPressed: () {
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return ChangeNotifierProvider(
                                                  create: (_) => FilterSheetViewModel (
                                                    FilterSheetModel(
                                                      hotelSelected: false,
                                                      guestHouseSelected: false,
                                                      gpSelected: false,
                                                      bayarTempatSelected: false,
                                                      wifiSelected: false,
                                                      loungeSelected: false,
                                                      kolamRenangSelected: false,
                                                      sarapanSelected: false,
                                                      rating: 0,
                                                      minValue: 0,
                                                      maxValue: 10000000,
                                                    ),
                                                  ),
                                                  child: Consumer<FilterSheetViewModel>(
                                                    builder: (context, viewModel, _) {
                                                      final filterSheetModel = viewModel.filterSheetModel;
                                                      return Container(
                                                        height: MediaQuery.of(context).size.height * 0.8,
                                                        alignment: Alignment.topCenter,
                                                        padding: const EdgeInsets.all(20),
                                                        child: SingleChildScrollView(
                                                          child: Column(
                                                          children: [
                                                            Container(
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  const Text(
                                                                    "Rentang Harga",
                                                                    style: TextStyle(
                                                                      fontFamily: 'Open Sans',
                                                                      fontWeight: FontWeight.w600,
                                                                      fontSize: 12,
                                                                      letterSpacing: 0.04,
                                                                    ),
                                                                  ),
                                                                  SfRangeSlider(
                                                                    min: 0.0,
                                                                    max: 10000000.0,
                                                                    values: _values,
                                                                    onChanged: (SfRangeValues values) {
                                                                      setState(() {
                                                                        _values = values;
                                                                        _minValueController.text = _values.start.toStringAsFixed(0);
                                                                        _maxValueController.text = _values.end.toStringAsFixed(0);
                                                                      });
                                                                    },
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      children: [
                                                                        Container(
                                                                          width: 125,
                                                                          height: 44,
                                                                          padding: const EdgeInsets.fromLTRB(16, 4, 0, 4),
                                                                          decoration: BoxDecoration(
                                                                            border: Border.all(
                                                                              color: Colors.grey,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                          ),
                                                                          child: TextFormField(
                                                                            controller: _minValueController,
                                                                            onChanged: (value) {
                                                                              final double minValue = double.tryParse(value) ?? 0;
                                                                              setState(() {
                                                                                _values = SfRangeValues(minValue, _values.end);
                                                                              });
                                                                            },
                                                                            keyboardType: TextInputType.number,
                                                                            decoration: const InputDecoration(
                                                                              border: InputBorder.none,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width: 120,
                                                                          height: 1.0,
                                                                          color: Colors.grey,
                                                                        ),
                                                                        Container(
                                                                          width: 125,
                                                                          height: 44,
                                                                          padding: const EdgeInsets.fromLTRB(16, 4, 0, 4),
                                                                          decoration: BoxDecoration(
                                                                            border: Border.all(
                                                                              color: Colors.grey,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                          ),
                                                                          child: TextFormField(
                                                                            controller: _maxValueController,
                                                                            onChanged: (value) {
                                                                              final double maxValue = double.tryParse(value) ?? 0;
                                                                              setState(() {
                                                                                _values = SfRangeValues(_values.start, maxValue);
                                                                              });
                                                                            },
                                                                            keyboardType: TextInputType.number,
                                                                            decoration: const InputDecoration(
                                                                              border: InputBorder.none,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(height: 20,),
                                                            Container(
                                                              height: 68,
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        "Rating",
                                                                        style: TextStyle(
                                                                          fontFamily: 'Open Sans',
                                                                          fontWeight: FontWeight.w600,
                                                                          fontSize: 12,
                                                                          letterSpacing: 0.04,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(height: 12,),
                                                                  RatingBar.builder(
                                                                    initialRating: _rating,
                                                                    minRating: 1,
                                                                    direction: Axis.horizontal,
                                                                    allowHalfRating: false,
                                                                    itemCount: 5,
                                                                    itemSize: 40,
                                                                    itemBuilder: (context, _) => Icon(
                                                                      Icons.star,
                                                                      color: _rating >= _ ? Colors.yellow : Colors.grey, // Use yellow color for selected stars
                                                                    ),
                                                                    onRatingUpdate: (rating) {
                                                                      setState(() {
                                                                        _rating = rating;
                                                                      });
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(height: 20,),
                                                            Container(
                                                              child: IntrinsicHeight(
                                                                child: Row(
                                                                  children: [
                                                                    Container(
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text('Tipe Akomodasi'),
                                                                          SizedBox(height: 20),
                                                                          GestureDetector(
                                                                            onTap: () {
                                                                              setState(() {
                                                                                isHotelSelected = !isHotelSelected;
                                                                              });
                                                                            },
                                                                            child: Row(
                                                                              children: [
                                                                                Checkbox(
                                                                                  value: isHotelSelected,
                                                                                  onChanged: (bool? value) {
                                                                                    setState(() {
                                                                                      isHotelSelected = value ?? false;
                                                                                    });
                                                                                  },
                                                                                ),
                                                                                Text('Hotel'),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          GestureDetector(
                                                                            onTap: () {
                                                                              setState(() {
                                                                                isGuestHouseSelected = !isGuestHouseSelected;
                                                                              });
                                                                            },
                                                                            child: Row(
                                                                              children: [
                                                                                Checkbox(
                                                                                  value: isGuestHouseSelected,
                                                                                  onChanged: (bool? value) {
                                                                                    setState(() {
                                                                                      isGuestHouseSelected = value ?? false;
                                                                                    });
                                                                                  },
                                                                                ),
                                                                                Text('Guest House'),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(width: 60,),
                                                                    Container(
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text('Fasilitas'),
                                                                          SizedBox(height: 20),
                                                                          GestureDetector(
                                                                            onTap: () {
                                                                              setState(() {
                                                                                isGpSelected = !isGpSelected;
                                                                              });
                                                                            },
                                                                            child: Row(
                                                                              children: [
                                                                                Checkbox(
                                                                                  value: isGpSelected,
                                                                                  onChanged: (bool? value) {
                                                                                    setState(() {
                                                                                      isGpSelected = value ?? false;
                                                                                    });
                                                                                  },
                                                                                ),
                                                                                Text('Gratis Pembatalan'),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          GestureDetector(
                                                                            onTap: () {
                                                                              setState(() {
                                                                                isBayarTempatSelected = !isBayarTempatSelected;
                                                                              });
                                                                            },
                                                                            child: Row(
                                                                              children: [
                                                                                Checkbox(
                                                                                  value: isBayarTempatSelected,
                                                                                  onChanged: (bool? value) {
                                                                                    setState(() {
                                                                                      isBayarTempatSelected = value ?? false;
                                                                                    });
                                                                                  },
                                                                                ),
                                                                                Text('Bayar di Tempat'),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          GestureDetector(
                                                                            onTap: () {
                                                                              setState(() {
                                                                                isWifiSelected = !isWifiSelected;
                                                                              });
                                                                            },
                                                                            child: Row(
                                                                              children: [
                                                                                Checkbox(
                                                                                  value: isWifiSelected,
                                                                                  onChanged: (bool? value) {
                                                                                    setState(() {
                                                                                      isWifiSelected = value ?? false;
                                                                                    });
                                                                                  },
                                                                                ),
                                                                                Text('Wi-Fi'),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          GestureDetector(
                                                                            onTap: () {
                                                                              setState(() {
                                                                                isLoungeSelected = !isLoungeSelected;
                                                                              });
                                                                            },
                                                                            child: Row(
                                                                              children: [
                                                                                Checkbox(
                                                                                  value: isLoungeSelected,
                                                                                  onChanged: (bool? value) {
                                                                                    setState(() {
                                                                                      isLoungeSelected = value ?? false;
                                                                                    });
                                                                                  },
                                                                                ),
                                                                                Text('Lounge'),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          GestureDetector(
                                                                            onTap: () {
                                                                              setState(() {
                                                                                isKolamRenangSelected = !isKolamRenangSelected;
                                                                              });
                                                                            },
                                                                            child: Row(
                                                                              children: [
                                                                                Checkbox(
                                                                                  value: isKolamRenangSelected,
                                                                                  onChanged: (bool? value) {
                                                                                    setState(() {
                                                                                      isKolamRenangSelected = value ?? false;
                                                                                    });
                                                                                  },
                                                                                ),
                                                                                Text('Kolam Renang'),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          GestureDetector(
                                                                            onTap: () {
                                                                              setState(() {
                                                                                isSarapanSelected = !isSarapanSelected;
                                                                              });
                                                                            },
                                                                            child: Row(
                                                                              children: [
                                                                                Checkbox(
                                                                                  value: isSarapanSelected,
                                                                                  onChanged: (bool? value) {
                                                                                    setState(() {
                                                                                      isSarapanSelected = value ?? false;
                                                                                    });
                                                                                  },
                                                                                ),
                                                                                Text('Sarapan'),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(height: 50,),
                                                            Container(
                                                              width: 320,
                                                              height: 40,
                                                              child: ElevatedButton(
                                                                onPressed: () {
                                                                  // Function
                                                                },
                                                                child: Text('Terapkan'),
                                                                style: ElevatedButton.styleFrom(
                                                                  primary: Colors.blue, 
                                                                  onPrimary: Colors.white, 
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(5.0), 
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        )
                                                      );
                                                    }
                                                  )
                                                );
                                              },
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            primary: Color(0xFFF0F0F0),
                                          ),
                                          child: Icon(
                                            Icons.tune,
                                            color: Colors.blue,
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
              ),
              SizedBox(height: 24,),
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
                                fontSize: 16,
                                letterSpacing: 0.25,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        SizedBox(height: 12,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: _viewModel.popularHotels.map((hotel) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              child: Column(
                                children: [
                                  Container(
                                    width: 150,
                                    height: 84,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4),
                                        topRight: Radius.circular(4),
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
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8, top: 16),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              hotel.name,
                                              style: TextStyle(
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                letterSpacing: 0.25,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Icon(Icons.location_on),
                                              Flexible(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      hotel.location,
                                                      softWrap: true,
                                                      overflow: TextOverflow.visible,
                                                      style: TextStyle(
                                                        fontFamily: 'Open Sans',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 10,
                                                        letterSpacing: 0.015,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 4,),
                                          Row(
                                            children: [
                                              Icon(Icons.star, size: 16, color: Colors.yellow),
                                              Icon(Icons.star, size: 16, color: Colors.yellow),
                                              Icon(Icons.star, size: 16, color: Colors.yellow),
                                              Icon(Icons.star, size: 16, color: Colors.yellow),
                                              Icon(Icons.star, size: 16, color: Colors.yellow),
                                            ],
                                          ),
                                          SizedBox(height: 4,),
                                          Row(
                                            children: [
                                              Text(
                                                hotel.price,
                                                softWrap: true,
                                                  overflow: TextOverflow.visible,
                                                  style: TextStyle(
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    letterSpacing: 0.025,
                                                  ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 12),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )).toList(),
                          ),
                        ),
                        SizedBox(height: 16,),
                        Row(
                          children: [
                            Text(
                              'Sedang Promo',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                letterSpacing: 0.25,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        SizedBox(height: 12,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: _viewModel.popularHotels.map((hotel) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              child: Column(
                                children: [
                                  Container(
                                    width: 150,
                                    height: 84,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4),
                                        topRight: Radius.circular(4),
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
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 8, right: 8, top: 16),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              hotel.name,
                                              style: TextStyle(
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                letterSpacing: 0.25,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Icon(Icons.location_on),
                                              Flexible(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      hotel.location,
                                                      softWrap: true,
                                                      overflow: TextOverflow.visible,
                                                      style: TextStyle(
                                                        fontFamily: 'Open Sans',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 10,
                                                        letterSpacing: 0.015,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 4,),
                                          Row(
                                            children: [
                                              Icon(Icons.star, size: 16, color: Colors.yellow),
                                              Icon(Icons.star, size: 16, color: Colors.yellow),
                                              Icon(Icons.star, size: 16, color: Colors.yellow),
                                              Icon(Icons.star, size: 16, color: Colors.yellow),
                                              Icon(Icons.star, size: 16, color: Colors.yellow),
                                            ],
                                          ),
                                          SizedBox(height: 4,),
                                          Row(
                                            children: [
                                              Text(
                                                hotel.price,
                                                softWrap: true,
                                                  overflow: TextOverflow.visible,
                                                  style: TextStyle(
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    letterSpacing: 0.025,
                                                  ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 12),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )).toList(),
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
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