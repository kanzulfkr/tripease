import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import '../../api/depature_api.dart';
import '../../model/depature_model.dart';
import 'package:flutter/material.dart';

enum SortingOption { empty, asc, desc }

extension SortingOptionExtension on SortingOption {
  String toStringValue() {
    switch (this) {
      case SortingOption.empty:
        return '';
      case SortingOption.asc:
        return 'asc';
      case SortingOption.desc:
        return 'desc';

      default:
        return '';
    }
  }
}

class ReturnProvider with ChangeNotifier {
  SortingOption? _selectedSortingOption = SortingOption.empty;
  SortingOption? get selectedSortingOption => _selectedSortingOption;

  void setSelectedSortingOption(SortingOption? sortingOption) {
    _selectedSortingOption = sortingOption;
    notifyListeners();
  }

  List<Datum> _returnData = [];
  List<Datum> get returnData => _returnData;

  String _returnDate = '';
  String get returnDate => _returnDate;

  DepartureResponseModel? _departureResponse;

  DepartureResponseModel? get departureResponse => _departureResponse;

  String? _selectedClass;
  String? get selectedClass => _selectedClass;

  bool _filter1 = false;
  bool get filter1 => _filter1;

  bool _filter2 = false;
  bool get filter2 => _filter2;

  bool _filter3 = false;
  bool get filter3 => _filter3;

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

  Future<void> fetchDepartures(
      {required int stationOriginId,
      required int stationDestinationId,
      String? trainClass,
      String? price,
      String? arriveTime
      // Add more query parameters as needed
      }) async {
    try {
      final response = await DepartureRepository().fetchDepartures(
        stationOriginId: stationOriginId,
        stationDestinationId: stationDestinationId,
        trainClass: trainClass,
        price: price,
        arriveTime: arriveTime,
      );

      _returnData = response.data!;

      notifyListeners();
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }

  void setReturnDate(DateTime date) {
    _returnDate = DateFormat('dd MMMM yyyy', 'id_ID').format(date);
    notifyListeners();
  }
}
