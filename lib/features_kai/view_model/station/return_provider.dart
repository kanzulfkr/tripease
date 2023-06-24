import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import '../../api/depature_api.dart';
import '../../model/depature_model.dart';

enum ReturnSortingOption { empty, asc, desc }

extension SortingOptionExtension on ReturnSortingOption {
  String toStringValue() {
    switch (this) {
      case ReturnSortingOption.empty:
        return '';
      case ReturnSortingOption.asc:
        return 'asc';
      case ReturnSortingOption.desc:
        return 'desc';

      default:
        return '';
    }
  }
}

class ReturnProvider with ChangeNotifier {
  ReturnSortingOption? _selectedSortingOption = ReturnSortingOption.empty;
  ReturnSortingOption? get selectedSortingOption => _selectedSortingOption;

  void setSelectedSortingOption(ReturnSortingOption? sortingOption) {
    _selectedSortingOption = sortingOption;
    notifyListeners();
  }

  List<Datum> _returns = [];
  List<Datum> get returns => _returns;

  String _departureDate = '';
  String get departureDate => _departureDate;

  String _returnDate = '';
  String get returnDate => _returnDate;

  DepartureResponseModel? _returnResponse;

  DepartureResponseModel? get returnResponse => _returnResponse;

  String? _selectedClass;
  String? get selectedClass => _selectedClass;

  bool _filter1 = false;
  bool get filter1 => _filter1;

  bool _filter2 = false;
  bool get filter2 => _filter2;

  bool _filter3 = false;
  bool get filter3 => _filter3;

  int? _selectedDepartIndex;
  int? get selectedDepartIndex => _selectedDepartIndex;

  void clearDeparture() {
    _returns = [];
    notifyListeners();
  }

  void setSelectedDepartIndex(int? index) {
    _selectedDepartIndex = index;
    notifyListeners();
  }

  void setSelectedClass(String? selectedClass) {
    _selectedClass = selectedClass;
    notifyListeners();
  }

  void setFilterOption1(bool value) {
    _filter1 = value;
    if (value) {
      _filter2 = false;
      _filter3 = false;
      _selectedClass = 'Ekonomi';
    } else {
      _selectedClass = null;
    }
    notifyListeners();
  }

  void setFilterOption2(bool value) {
    _filter2 = value;
    if (value) {
      _filter1 = false;
      _filter3 = false;
      _selectedClass = 'Bisnis';
    } else {
      _selectedClass = null;
    }
    notifyListeners();
  }

  void setFilterOption3(bool value) {
    _filter3 = value;
    if (value) {
      _filter1 = false;
      _filter2 = false;
      _selectedClass = 'Eksekutif';
    } else {
      _selectedClass = null;
    }
    notifyListeners();
  }

  Future<void> fetchReturns(
      {required int stationOriginId,
      required int stationDestinationId,
      String? trainClass,
      String? price,
      String? arriveTime}) async {
    try {
      final response = await DepartureRepository().fetchDepartures(
        stationOriginId: stationOriginId,
        stationDestinationId: stationDestinationId,
        trainClass: trainClass,
        price: price,
        arriveTime: arriveTime,
      );

      _returns = response.data!;

      notifyListeners();
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }

  void setDepartureDate(DateTime date) {
    _returnDate = DateFormat('dd MMMM yyyy', 'id_ID').format(date);
    notifyListeners();
  }

  void setReturnDate(DateTime date) {
    _returnDate = DateFormat('dd MMMM yyyy', 'id_ID').format(date);
    notifyListeners();
  }

  String getDurationKA(String originArriveTime, String departureArriveTime) {
    var arrvhours1 = originArriveTime[0];
    var arrvhours2 = originArriveTime[1];
    var arrvminuts1 = originArriveTime[3];
    var arrvminuts2 = originArriveTime[4];

    var dptrhours1 = departureArriveTime[0];
    var dptrhours2 = departureArriveTime[1];
    var dptrminuts1 = departureArriveTime[3];
    var dptrminuts2 = departureArriveTime[4];
    DateTime berangkat = DateTime(
        2023,
        6,
        20,
        int.parse(dptrhours1 + dptrhours2),
        int.parse(dptrminuts1 + dptrminuts2));
    DateTime tiba = DateTime(2023, 6, 20, int.parse(arrvhours1 + arrvhours2),
        int.parse(arrvminuts1 + arrvminuts2));

    Duration durasi = berangkat.difference(tiba);
    int jam = durasi.inHours;
    int menit = durasi.inMinutes.remainder(60);
    return '$jam j $menit m';
  }
}
