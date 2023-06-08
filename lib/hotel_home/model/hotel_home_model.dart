import 'package:table_calendar/table_calendar.dart';

class HotelModel {
  String location = '';
  String date = '';
  int roomCount = 0;
  int adultCount = 0;
  int childCount = 0;
}

class Hotel {
  final String name;
  final String location;
  final String image;
  final String price;

  Hotel({
    required this.name,
    required this.location,
    required this.image,
    required this.price
  });
}

DateTime today = DateTime.now();
CalendarFormat calendarFormat = CalendarFormat.month;
DateTime? selectedDated;
