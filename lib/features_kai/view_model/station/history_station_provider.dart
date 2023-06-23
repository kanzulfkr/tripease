import 'package:flutter/material.dart';

import '../../api/history_station_api.dart';
import '../../model/history_station_model.dart';

class HistoryStationProvider extends ChangeNotifier {
  List<Datum> _history = [];
  List<Datum> get histories => _history;

  Future<void> fetchHistoryStation() async {
    try {
      final response = await HistoryStationApi().getHistoryStation();
      _history = response.data!;
      notifyListeners();
      print('History : $histories');
    } catch (e) {
      print(e);
    }
  }
}
