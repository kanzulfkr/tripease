import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../api/station_api.dart';
import '../../model/station_model.dart';

enum GetStationStatus { empty, loading, success, error }

class StationProvider extends ChangeNotifier {
  List<Datum> _station = [];
  List<Datum> get station => _station;
  String _message = '';
  String get message => _message;
  String _query = '';
  String get query => _query;

  int? _idOrigin;
  int? get idOrigin => _idOrigin;

  String? nameOrigin;
  String? get getNameOrigin => nameOrigin;

  String? initialOrigin;
  String? get getInitialOrigin => initialOrigin;

  int? _idDestination;
  int? get idDestination => _idDestination;

  String? nameDestination;
  String? get getNameDestination => nameDestination;

  String? initialDestination;
  String? get getInitialDestination => initialDestination;

  int? _qtyAdult;
  int? get qtyAdult => _qtyAdult;

  int? _qtyInfant;
  int? get qtyInfant => _qtyInfant;

  GetStationStatus _getStationStatus = GetStationStatus.empty;
  GetStationStatus get getStationStatus => _getStationStatus;

  StationApi _stationApi = StationApi();

  bool _pulangPergi = false;
  bool get pulangPergi => _pulangPergi;

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

  Future<void> setQtyAdult(int? qty) async {
    _qtyAdult = qty;
    notifyListeners();
  }

  Future<void> setQtyInfant(int? qty) async {
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
}
