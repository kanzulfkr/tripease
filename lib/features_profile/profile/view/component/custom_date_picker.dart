import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

DateTime today = DateTime.now();
CalendarFormat calendarFormat = CalendarFormat.month;
DateTime? selectedDated;

void _showDateBottomSheet(BuildContext context) {
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
          DateTime selectedDate = DateTime.now();
          return Container(
            decoration: const BoxDecoration(
              color: Color(
                  0xFFF0F0F8), // Ubah warna latar belakang sesuai dengan #F0F0F8
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
                      style: TextStyle(
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
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 118,
                        ),
                        Icon(Icons.edit),
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
                          selectedDate = selectedDay;
                        });
                      },
                      focusedDay: selectedDate,
                      locale: 'id_ID', // Set locale ke Indonesia
                      calendarFormat: calendarFormat,
                      headerStyle: const HeaderStyle(
                        formatButtonTextStyle:
                            TextStyle(color: Colors.transparent),
                        formatButtonDecoration:
                            BoxDecoration(color: Colors.transparent),
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
                            // Tombol Batal
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Batal',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Tombol Kirim
                          Navigator.of(context).pop(selectedDated);
                        },
                        child: Text(
                          'OK',
                          style: TextStyle(
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
