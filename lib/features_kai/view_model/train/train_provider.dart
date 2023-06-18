import 'package:flutter/material.dart';

class TrainProvider extends ChangeNotifier {
  int? _trainId;
  int? get getTrainId => _trainId;

  String? _nameTrain;
  String? get getNameTrain => _nameTrain;

  String? _stationOrigin;
  String? get getStationOrigin => _stationOrigin;

  String? _stationDepature;
  String? get getStationDepature => _stationDepature;

  String? _stationOriginInitial;
  String? get getStationOriginInitial => _stationOriginInitial;

  String? _stationDepatureInitial;
  String? get getStationDepatureInitial => _stationDepatureInitial;

  String? _classTrain;
  String? get getClassTrain => _classTrain;

  int? _price;
  int? get getPrice => _price;

  String? _arriveTime;
  String? get getArriveTime => _arriveTime;

  String? _depatureTime;
  String? get getDepatureTime => _depatureTime;

  String? _dateTime;
  String? get getdateTime => _dateTime;

  Future<void> setTrainId(int? trainId) async {
    _trainId = trainId;
    notifyListeners();
  }

  Future<void> setNameTrain(String? nameTrain) async {
    _nameTrain = nameTrain;
    notifyListeners();
  }

  Future<void> setStationOrigin(String? stsOrigin) async {
    _stationOrigin = stsOrigin;
    notifyListeners();
  }

  Future<void> setStationDepature(String? stsDepature) async {
    _stationDepature = stsDepature;
    notifyListeners();
  }

  Future<void> setStationOriginInitial(String? stsOriginInt) async {
    _stationOriginInitial = stsOriginInt;
    notifyListeners();
  }

  Future<void> setStationDepatureInitial(String? stsDepatureInt) async {
    _stationDepatureInitial = stsDepatureInt;
    notifyListeners();
  }

  Future<void> setClassTrain(String? clsTrain) async {
    _classTrain = clsTrain;
    notifyListeners();
  }

  Future<void> setPrice(int? prc) async {
    _price = prc;
    notifyListeners();
  }

  Future<void> setArriveTime(String? arvTime) async {
    _arriveTime = arvTime;
    notifyListeners();
  }

  Future<void> setDepatureTime(String? dptrTime) async {
    _depatureTime = dptrTime;
    notifyListeners();
  }

  Future<void> setdateTime(String? dtTime) async {
    _dateTime = dtTime;
    notifyListeners();
  }
}
