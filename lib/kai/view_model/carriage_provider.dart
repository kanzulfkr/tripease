import 'package:flutter/material.dart';

import '../api/train_carriage_api.dart';
import '../model/train_carriage_mode.dart';

class CarriageProvider with ChangeNotifier {
  List<Datum> _carriage = [];
  List<Datum> get carriage => _carriage;

  

  Future<void> fetchCarriage(
      {required int trainId,
      String? trainClass,
      String? date,
      String? status,
      int? page,
      int? limit}) async {
    try {
      final response = await CarriageRepo().fetchCarriage(
          trainId: trainId,
          trainClass: trainClass,
          date: date,
          status: status,
          page: page,
          limit: limit);

      _carriage = response.data ?? [];

      notifyListeners();
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }
}
