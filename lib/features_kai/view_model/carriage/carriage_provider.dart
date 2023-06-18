// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import '../../api/carriage_api.dart';
import '../../model/carriage.dart';

class CarriageProvider with ChangeNotifier {
  List<Datum> _carriage = [];
  List<Datum> get carriage => _carriage;

  List<Seat> seatA = [];
  List<Seat> seatB = [];
  List<Seat> seatC = [];
  List<Seat> seatD = [];
  List<Seat> seatE = [];

  int selectedTabIndex = 0;

  void setSelectedTabIndex(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }

  int? _trainSeatId;
  int? get trainSeatId => _trainSeatId;

  void setTrainSeatId(int? id) {
    _trainSeatId = id;
    notifyListeners();
  }

  Future<void> fetchCarriageEko({
    required int trainId,
    String? trainClass,
    String? date,
    String? status,
    int? page,
    int? limit,
  }) async {
    try {
      final response = await CarriageRepo().fetchCarriage(
        trainId: trainId,
        trainClass: trainClass,
        date: date,
        status: status,
        page: page,
        limit: limit,
      );

      _carriage = response.data ?? [];

      if (_carriage.isNotEmpty) {
        if (_carriage[selectedTabIndex].seat != null) {
          List<Seat> seats = _carriage[selectedTabIndex]
              .seat!
              .map((seat) => Seat(
                    id: seat.id,
                    name: seat.name,
                  ))
              .toList();
          seatA = seats.where((seat) => seat.name!.startsWith('A')).toList();
          seatB = seats.where((seat) => seat.name!.startsWith('B')).toList();
          seatC = seats.where((seat) => seat.name!.startsWith('C')).toList();
          seatD = seats.where((seat) => seat.name!.startsWith('D')).toList();
          seatE = seats.where((seat) => seat.name!.startsWith('E')).toList();
          // Rest of your code...
        } else {
          print('The seat property is null.');
        }
      } else {
        print('The _carriage list is empty.');
      }

      notifyListeners();
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }
}
