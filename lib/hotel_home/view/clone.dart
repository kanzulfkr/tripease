import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_1/filter_bottomsheet/model/bottomsheet_model.dart';
import 'package:hotel_1/filter_bottomsheet/view/sheet.dart';
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
                          if (dateProvider.checkInDate == null || dateProvider.checkOutDate != null) {
                            dateProvider.setCheckInDate(selectedDay);
                            dateProvider.setCheckOutDate(null);
                          } else {
                            if (selectedDay.isAfter(dateProvider.checkInDate!)) {
                              dateProvider.setCheckOutDate(selectedDay);
                            } else {
                              dateProvider.setCheckInDate(selectedDay);
                              dateProvider.setCheckOutDate(null);
                            }
                          }
                        });
                        },
                        selectedDayPredicate: (day) {
                          if (dateProvider.checkInDate == null || dateProvider.checkOutDate == null) {
                            return day == dateProvider.checkInDate || day == dateProvider.checkOutDate;
                          } else {
                            return day == dateProvider.checkInDate || day == dateProvider.checkOutDate || (day.isAfter(dateProvider.checkInDate!) && day.isBefore(dateProvider.checkOutDate!));
                          }
                        },
                        calendarStyle: CalendarStyle(
                          selectedDecoration: BoxDecoration(
                            color: Colors.blue, 
                            shape: BoxShape.circle,
                          ),
                          selectedTextStyle: TextStyle(color: Colors.white),
                          todayDecoration: BoxDecoration(
                            color: Colors.grey[300],
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
                            if (dateProvider.checkInDate != null && dateProvider.checkOutDate != null) {
                              // Both check-in and check-out dates are selected
                              Navigator.of(context).pop([dateProvider.checkInDate, dateProvider.checkOutDate]);
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
                                'Address',
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
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return HotelSearchView(); 
                                    },
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
                                                ? '${DateFormat('dd MMMM yyyy', 'id_ID').format(checkInDate !)} - ${DateFormat('dd MMMM yyyy', 'id_ID').format(checkOutDate!)}'
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
                                                return CustomBottomSheet(); // Replace with the desired bottom sheet widget
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