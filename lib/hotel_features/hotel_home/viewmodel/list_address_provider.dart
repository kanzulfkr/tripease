import 'package:flutter/material.dart';

import '../../api/list_address.dart';
import '../model/list_address.dart';

class AddressProvider with ChangeNotifier {
  List<Datum> _hotel = [];
  List<Datum> get hotel => _hotel;
  String? _query = '';
  String? get query => _query;

  void updateSearchQuery(String? query) {
    _query = query;
    notifyListeners();
  }

  List<Datum> searchAddress(String? query) {
    _query = query ?? '';
    if (_query == '') {
      return _hotel;
    } else {
      return _hotel
          .where((element) =>
              element.address!.toLowerCase().contains(_query!.toLowerCase()))
          .toList();
    }
  }

  Future<void> listAddress() async {
    try {
      final response = await ListAddressAPI().addressList();
      _hotel = response.data ?? [];
      notifyListeners();
    } catch (e) {
      print('errpr: ${e}');
    }
  }
}
