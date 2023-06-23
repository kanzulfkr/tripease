import 'package:flutter/material.dart';

import '../../payment_hotel/model/order_model.dart';

class InputGuestProvider with ChangeNotifier {
  String? _orderName;

  String? get orderName => _orderName;

  String? _orderEmail;

  String? get orderEmail => _orderEmail;

  String? _orderPhone;

  String? get orderPhone => _orderPhone;

  String? _request;

  String? get request => _request;

  List<TravelerDetail>? travelerDetail = [];

  void updateTravelerTitle(int index, String? title) {
    if (index >= 0 && index < travelerDetail!.length) {
      travelerDetail?[index].title = title;
      notifyListeners();
    }
  }

  void setOrderName(String? orderName) {
    _orderName = orderName;
    notifyListeners();
  }

  void setOrderEmail(String? orderEmail) {
    _orderEmail = orderEmail;
    notifyListeners();
  }

  void setOrderPhone(String? orderPhone) {
    _orderPhone = orderPhone;
    notifyListeners();
  }

  void setRequest(String? request) {
    _request = request;
    notifyListeners();
  }
}
