import 'package:capstone_project_tripease/kai/view/departure_schedule/departure_schedule.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class KaPage extends StatefulWidget {
  const KaPage({Key? key}) : super(key: key);

  @override
  State<KaPage> createState() => _KaPageState();
}

class _KaPageState extends State<KaPage> {
  bool isDropdownOpened = false;
  double containerHeight = 474.0;
  DateTime? selectD;
  DateTime selectedDate = DateTime.now();
  DateTime? selectedDated;
  TextEditingController tglPergiEditingController = TextEditingController();
  TextEditingController tglKembaliEditingController = TextEditingController();
  bool val = false;
  CalendarFormat calendarFormat = CalendarFormat.month;
  String? selectedValue;
  List<String> dropdownItems = ['Ekonomi', 'Bisnis', 'Eksekutif'];
  List<String> cities = ['BD', 'GMR', 'SMC', 'SMT', 'MDN', 'BNJ'];
  List<String> cities2 = [
    'Bandung',
    'Gambir',
    'Semarang Poncol',
    'Semarang Tawang',
    'Medan',
    'Binjai',
    'Jakarta',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kereta Api',
          style: GoogleFonts.openSans(
            fontSize: 16,
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
    return Container(
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
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            height: containerHeight,
            width: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Asal',
                    style: GoogleFonts.openSans(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/location_on.svg',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: 200,
                        child: TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                            labelText: 'Medan (MDN)',
                            hintStyle: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0x96989C9C)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Color(0xD2D7E0FF))),
                          ),
                          onTap: () {
                            _showCariBottomSheet(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Tujuan',
                            style: GoogleFonts.openSans(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 222,
                          ),
                          SvgPicture.asset('assets/icons/swap_vert.svg'),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/location_on.svg',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                            width: 200,
                            child: TextField(
                              maxLines: 1,
                              decoration: InputDecoration(
                                labelText: 'Binjai (BNJ)',
                                hintStyle: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0x96989C9C)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: Color(0xD2D7E0FF))),
                              ),
                              onTap: () {
                                _showCariBottomSheet(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14.5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Tanggal Keberangkatan',
                        style: GoogleFonts.openSans(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 70.0,
                      ),
                      Text(
                        'Pulang Pergi?',
                        style: GoogleFonts.openSans(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 44,
                            width: 177,
                            child: Stack(
                              children: [
                                TextFormField(
                                  maxLines: 1,
                                  controller: tglPergiEditingController,
                                  decoration: InputDecoration(
                                    labelText: 'Pilih Tanggal',
                                    hintStyle: GoogleFonts.openSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0x96989C9C),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: Color(0xD2D7E0FF),
                                      ),
                                    ),
                                    suffixIcon: SizedBox(
                                      width: 48,
                                      height: 48,
                                      child: InkWell(
                                        onTap: () {
                                          _showDateBottomSheet();
                                        },
                                        child: Icon(Icons.calendar_month),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 33.5,
                      ),
                      CupertinoSwitch(
                        activeColor: Colors.blueAccent,
                        trackColor: Colors.grey,
                        value: val,
                        onChanged: (newValue) {
                          setState(() {
                            val = newValue;
                            containerHeight = val ? 544.0 : 474.0;
                          });
                        },
                      )
                    ],
                  ),
                  if (val)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Tanggal Kembali',
                            style: GoogleFonts.openSans(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            height: 44,
                            width: 177,
                            child: Stack(
                              children: [
                                TextFormField(
                                  maxLines: 1,
                                  controller: tglKembaliEditingController,
                                  decoration: InputDecoration(
                                    labelText: 'Pilih Tanggal',
                                    hintStyle: GoogleFonts.openSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0x96989C9C),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: Color(0xD2D7E0FF),
                                      ),
                                    ),
                                    suffixIcon: SizedBox(
                                      width: 48,
                                      height: 48,
                                      child: InkWell(
                                        onTap: () {
                                          _showDateBottomSheet();
                                        },
                                        child: Icon(Icons.calendar_month),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  Row(
                    children: [
                      Text(
                        'Dewasa',
                        style: GoogleFonts.openSans(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      Container(
                        height: 44,
                        width: 92,
                        margin: const EdgeInsets.only(top: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                            labelText: '0',
                            hintStyle: GoogleFonts.openSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0x96989C9C),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xD2D7E0FF)),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Anak -',
                            style: GoogleFonts.openSans(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Anak',
                            style: GoogleFonts.openSans(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Container(
                        height: 44,
                        width: 92,
                        margin: const EdgeInsets.only(top: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                            labelText: '0',
                            hintStyle: GoogleFonts.openSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0x96989C9C),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xD2D7E0FF)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      Text(
                        'Jenis Kereta Api',
                        style: GoogleFonts.openSans(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        height: 40,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.r),
                          ),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            hint: Text(
                              'Pilih',
                              style: GoogleFonts.openSans(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 2,
                            ),
                            value: selectedValue,
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                              ),
                              openMenuIcon: Icon(Icons.arrow_drop_up),
                            ),
                            isExpanded: true,
                            underline: const SizedBox(),
                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = value;
                              });
                            },
                            items: dropdownItems
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DepartureSchedule()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        primary: Colors.blue,
                        minimumSize: const Size(220, 40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          'Cari',
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDateBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      builder: (BuildContext context) {
        DateTime selectedDate = DateTime.now();
        DateTime? selectedDated;

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
                        'Pilih Tanggal',
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
                            '${DateFormat('EEEE, dd MMMM', 'id_ID').format(selectedDate)}',
                            style: GoogleFonts.openSans(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 118,
                          ),
                          const Icon(Icons.edit),
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
                      height: 524,
                      width: 380,
                      child: TableCalendar(
                        selectedDayPredicate: (day) {
                          return isSameDay(selectedDate, day);
                        },
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            selectedDated = selectedDay;
                            selectedDate = selectedDay;
                            tglPergiEditingController.text =
                                DateFormat('EEEE, dd MMMM', 'id_ID')
                                    .format(selectedDay);
                            tglKembaliEditingController.text =
                                DateFormat('EEEE, dd MMMM', 'id_ID')
                                    .format(selectedDay);
                          });
                        },
                        focusedDay: selectedDate,
                        locale: 'id_ID', // Set locale ke Indonesia
                        calendarFormat: CalendarFormat.month,
                        headerStyle: const HeaderStyle(
                          formatButtonTextStyle:
                              TextStyle(color: Colors.transparent),
                          formatButtonDecoration:
                              BoxDecoration(color: Colors.transparent),
                        ),
                        calendarStyle: CalendarStyle(
                          selectedDecoration: const BoxDecoration(
                            color: Colors.lightBlueAccent,
                            shape: BoxShape.circle,
                          ),
                          todayDecoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                          ),
                        ),
                        onPageChanged: (focusedDay) {
                          setState(() {
                            selectedDate = focusedDay;
                          });
                        },
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
                            Navigator.of(context).pop(selectedDated);
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

  void _showCariBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 868,
          width: 360,
          color: const Color(0xF9FAFBFB),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 44,
                  width: 320,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xD2D7E0E0),
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xF9FAFBFB),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 18.5),
                          child: Icon(
                            Icons.search,
                            color: Color(0X96989C9C),
                            size: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10.84,
                          height: 12,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Cari kota atau stasiun',
                              hintStyle: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0x96989C9C),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Image.asset(
                        'assets/images/error_search.png',
                        height: 196,
                        width: 181.5,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Tidak ditemukan hasil untuk 'Malaysia'! ",
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xDBDB2D24)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Mohon untuk mencoba kata kunci berbeda. ",
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xDBDB2D24)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Stasiun Populer',
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: const Color(0x96989C9C)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 312,
                      width: 320,
                      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
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
                            offset: const Offset(
                                0, 3), // Mengatur bayangan pada sumbu Y
                          ),
                        ],
                      ),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: cities.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          cities[index],
                                          style: GoogleFonts.openSans(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                          width: 5,
                                          height: 5,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          cities2[index],
                                          style: GoogleFonts.openSans(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      cities2[index],
                                      style: GoogleFonts.openSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 1,
                                color: Colors.grey,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Histori Pencarian',
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: const Color(0x96989C9C)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 312,
                      width: 320,
                      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
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
                            offset: const Offset(
                                0, 3), // Mengatur bayangan pada sumbu Y
                          ),
                        ],
                      ),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: cities.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          cities[index],
                                          style: GoogleFonts.openSans(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                          width: 5,
                                          height: 5,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          cities2[index],
                                          style: GoogleFonts.openSans(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 1,
                                color: Colors.grey,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                              ),
                            ],
                          );
                        },
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
  }
}
