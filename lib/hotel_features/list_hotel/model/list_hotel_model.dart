import 'package:flutter/material.dart';

class ListHotel {
  final String name;
  final String address;
  final String imageUrl;
  final dynamic price;
  final dynamic discPrice;
  final String navigateUrl;
  final String detailedAddress;

  ListHotel({
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.price,
    required this.discPrice,
    required this.navigateUrl,
    required this.detailedAddress,
  });
}

class PopUpModel {
  String location = '';
  String date = '';
  int roomCount = 0;
  int adultCount = 0;
  int childCount = 0;
}

class SortingOption extends ChangeNotifier {
  String value;

  SortingOption(this.value);
}
