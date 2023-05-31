import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  bool isHotelView = true;
  bool isKeretaApiView = false;

  void toggleView() {
    if (isHotelView) {
      isHotelView = false;
      isKeretaApiView = true;
    } else {
      isHotelView = true;
      isKeretaApiView = false;
    }
    notifyListeners();
  }
}
