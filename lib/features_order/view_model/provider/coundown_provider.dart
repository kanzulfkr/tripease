import 'dart:async';

import 'package:flutter/material.dart';

import '../../apis/hotel/hotel_order_update_api.dart';
import '../../model/hotel/hotel_order_model.dart';

class CountdownProvider with ChangeNotifier {
  int _endTime;

  CountdownProvider(this._endTime);

  int get endTime => _endTime;

  set endTime(int value) {
    _endTime = value;
    notifyListeners();
  }
}
