import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../model/hotel_home_model.dart';

class HotelViewModel extends ChangeNotifier {
  HotelModel _model = HotelModel();

  String get location => _model.location;
  set location(String value) {
    _model.location = value;
    notifyListeners();
  }

  String get date => _model.date;
  set date(String value) {
    _model.date = value;
    notifyListeners();
  }

  int get roomCount => _model.roomCount;
  set roomCount(int value) {
    _model.roomCount = value;
    notifyListeners();
  }

  int get adultCount => _model.adultCount;
  set adultCount(int value) {
    _model.adultCount = value;
    notifyListeners();
  }

  int get childCount => _model.childCount;
  set childCount(int value) {
    _model.childCount = value;
    notifyListeners();
  }

  List<Hotel> get popularHotels {
    // Logic to fetch popular hotels
    return [
      Hotel(
        name: 'JW Marriot',
        location: 'Jl. Putri Hijau No. 10 Medan, Indonesia',
        image: 'assets/images/hotel1.jpeg',
        price: 'Rp 1.750.000'
      ),
      Hotel(
        name: 'Marina Bay Sands',
        location: '10 Bayfrond Ave Singapore',
        image: 'assets/images/hotel2.jpeg',
        price: 'Rp 9.850.000'
      ),
      Hotel(
        name: 'Marina Bay Sands',
        location: '10 Bayfrond Ave Singapore',
        image: 'assets/images/hotel2.jpeg',
        price: 'Rp 9.850.000'
      ),
      // Add more hotels as needed
    ];
  }

  void searchHotels() {
    // Logic to perform hotel search
  }


}
