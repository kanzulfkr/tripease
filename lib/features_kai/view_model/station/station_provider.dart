import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../api/station_api.dart';
import '../../model/station_model.dart';

enum GetStationStatus { empty, loading, success, error }

class StationProvider extends ChangeNotifier {
  bool loading = false;
  List<dynamic> _searchStation = [];

  List<dynamic> get allStation => _searchStation;

  TextEditingController asalController = TextEditingController();
  TextEditingController tujuanController = TextEditingController();

  List<Datum> _station = [];
  List<Datum> get station => _station;

  String _message = '';
  String get message => _message;

  String _query = '';
  String get query => _query;

  int? _idOrigin;
  int? get getIdOrigin => _idOrigin;

  String? nameOrigin;
  String? get getNameOrigin => nameOrigin;

  String? initialOrigin;
  String? get getInitialOrigin => initialOrigin;

  int? _idDestination;
  int? get getIdDestination => _idDestination;

  String? nameDestination;
  String? get getNameDestination => nameDestination;

  String? initialDestination;
  String? get getInitialDestination => initialDestination;

  int _qtyAdult = 0;
  int get qtyAdult => _qtyAdult;

  int? _qtyInfant = 0;
  int? get qtyInfant => _qtyInfant;

  GetStationStatus _getStationStatus = GetStationStatus.empty;
  GetStationStatus get getStationStatus => _getStationStatus;

  StationApi _stationApi = StationApi();

  bool _pulangPergi = false;
  bool get pulangPergi => _pulangPergi;

  Future<void> getSearchStation() async {
    var response = await StationApi().getAllStation();
    _searchStation = response.data['data'];
    notifyListeners();
  }

  Future<void> getStation() async {
    _getStationStatus = GetStationStatus.loading;
    notifyListeners();
    try {
      final data = await _stationApi.getStationData();
      _station = data.data!;

      notifyListeners();
    } on DioError catch (e) {
      debugPrint('Error : $e');
      if (e.response != null && e.response!.statusCode == 400) {
        final errorMessage = e.response!.data[
            'errors']; // Assuming the response body contains a 'message' field

        _message = errorMessage;
      }

      _getStationStatus = GetStationStatus.error;

      notifyListeners();
    }
  }

  List<Datum> searchStation(String? query) {
    _query = query ?? '';
    if (_query == '') {
      return _station;
    } else {
      return _station
          .where((element) =>
              element.name!.toLowerCase().contains(_query.toLowerCase()))
          .toList();
    }
  }

  Future<void> setIdOrigin(int? id) async {
    _idOrigin = id;
    notifyListeners();
  }

  Future<void> setNameOrigin(String? name) async {
    nameOrigin = name;
    notifyListeners();
  }

  Future<void> setInitialOrigin(String? initial) async {
    initialOrigin = initial;
    notifyListeners();
  }

  Future<void> setIdDestination(int? id) async {
    _idDestination = id;
    notifyListeners();
  }

  Future<void> setNameDestination(String? name) async {
    nameDestination = name;
    notifyListeners();
  }

  Future<void> setInitialDestination(String? initial) async {
    initialDestination = initial;
    notifyListeners();
  }

  void setQtyAdult(int qty) {
    _qtyAdult = qty;
    notifyListeners();
  }

  void setQtyInfant(int? qty) {
    _qtyInfant = qty;
    notifyListeners();
  }

  Future<void> setPulangPergi(bool value) async {
    _pulangPergi = value;
    notifyListeners();
  }

  void updateSearchQuery(String newQuery) {
    _query = newQuery;
    notifyListeners();
  }

  void switchStations() {
    int? tempId = _idOrigin;
    String? tempName = nameOrigin;
    String? tempInitial = initialOrigin;
    String? tempAsal = asalController.text;

    _idOrigin = _idDestination;
    nameOrigin = nameDestination;
    initialOrigin = initialDestination;
    asalController.text = tujuanController.text;

    _idDestination = tempId;
    nameDestination = tempName;
    initialDestination = tempInitial;
    tujuanController.text = tempAsal;

    // int? tempId = _idOrigin;

    // _idOrigin = _idDestination;

    // _idDestination = tempId;

    notifyListeners();
  }

  void setAsalController(String value) {
    asalController.text = value;
    notifyListeners();
  }

  void setTujuanController(String value) {
    tujuanController.text = value;
    notifyListeners();
  }
}
