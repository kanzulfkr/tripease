import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/hotel_model.dart';

class OrderProvider with ChangeNotifier {
  List<String> _orderList = [];
  List<String> _filteredOrderList = [];

  List<String> get filteredOrderList => _filteredOrderList;

  Future<void> fetchData() async {
    String apiUrl = '';

    try {
      final responese = await http.get(Uri.parse(apiUrl));
      if (responese.statusCode == 200) {
        final data = json.decode(responese.body);
        List<String> orders = List<String>.from(data);
        _orderList = orders;
        _filteredOrderList = orders;
      } else {
        _orderList = [];
        _filteredOrderList = [];
      }
    } catch (error) {
      _orderList = [];
      _filteredOrderList = [];
    }
    notifyListeners();
  }

  void filterOrders(String query) {
    _filteredOrderList = _orderList
        .where((order) => order.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
