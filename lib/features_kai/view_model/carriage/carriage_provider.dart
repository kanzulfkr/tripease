// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import '../../api/carriage_api.dart';
import '../../model/carriage_model.dart';

class CarriageProvider with ChangeNotifier {
  List<Datum> _carriage = [];
  List<Datum> get carriage => _carriage;

  List<Seat> _seatA = [];
  List<Seat> get seatA => _seatA;
  List<Seat> _seatB = [];
  List<Seat> get seatB => _seatB;
  List<Seat> _seatC = [];
  List<Seat> get seatC => _seatC;
  List<Seat> _seatD = [];
  List<Seat> get seatD => _seatD;
  List<Seat> _seatE = [];
  List<Seat> get seatE => _seatE;

  // String trainClass = 'ekonomi';

  int? _selectedTabIndex = 0;
  int? get selectedTabIndex => _selectedTabIndex;

  void setSelectedTabIndex(int index) {
    _selectedTabIndex = index;
    updateSeatLists();
    notifyListeners();
  }

  int? _trainSeatId;
  int? get trainSeatId => _trainSeatId;

  void setTrainSeatId(int? id) {
    _trainSeatId = id;
    notifyListeners();
  }

  void updateSeatLists() {
    if (_carriage.isNotEmpty) {
      if (_carriage[_selectedTabIndex as int].seat != null) {
        List<Seat> seats = _carriage[_selectedTabIndex as int]
            .seat!
            .map((seat) => Seat(
                  id: seat.id,
                  name: seat.name,
                ))
            .toList();
        _seatA = seats.where((seat) => seat.name!.startsWith('A')).toList();
        _seatB = seats.where((seat) => seat.name!.startsWith('B')).toList();
        _seatC = seats.where((seat) => seat.name!.startsWith('C')).toList();
        _seatD = seats.where((seat) => seat.name!.startsWith('D')).toList();
        _seatE = seats.where((seat) => seat.name!.startsWith('E')).toList();

        debugPrint('Added');
        notifyListeners();
      } else {
        // Clear the seat lists if the seat property is null
        _seatA.clear();
        _seatB.clear();
        _seatC.clear();
        _seatD.clear();
        _seatE.clear();
        debugPrint('Cleared1');
        notifyListeners();
      }
    } else {
      // Clear the seat lists if the carriage list is empty
      _seatA.clear();
      _seatB.clear();
      _seatC.clear();
      _seatD.clear();
      _seatE.clear();
      debugPrint('Cleared2');
      notifyListeners();
    }
  }

  Future<void> fetchCarriageEko({
    required int trainId,
    String? trainClass,
    String? date,
    String? status,
    int? page,
    int? limit,
  }) async {
    // try {
    final response = await CarriageRepo().fetchCarriage(
      trainId: trainId,
      trainClass: trainClass,
      date: date,
      status: status,
      page: page,
      limit: limit,
    );
    print(response.data?[0].name);

    _carriage = response.data!;

    // if (_carriage.isNotEmpty) {
    //   if (_carriage[_selectedTabIndex as int].seat != null) {
    //     List<Seat> seats = _carriage[_selectedTabIndex as int]
    //         .seat!
    //         .map((seat) => Seat(
    //               id: seat.id,
    //               name: seat.name,
    //             ))
    //         .toList();
    //     seatA = seats.where((seat) => seat.name!.startsWith('A')).toList();
    //     seatB = seats.where((seat) => seat.name!.startsWith('B')).toList();
    //     seatC = seats.where((seat) => seat.name!.startsWith('C')).toList();
    //     seatD = seats.where((seat) => seat.name!.startsWith('D')).toList();
    //     seatE = seats.where((seat) => seat.name!.startsWith('E')).toList();
    //     // Rest of your code...

    //     debugPrint('seatA: $seatA');
    //     debugPrint('seatB: $seatB');
    //     debugPrint('seatC: $seatC');
    //     debugPrint('seatD: $seatD');
    //     debugPrint('seatE: $seatE');
    //   } else {
    //     print('The seat property is null.');
    //   }
    // } else {
    //   print('The _carriage list is empty.');
    // }

    updateSeatLists();

    // Filter seats and assign them to respective lists

    notifyListeners();
    // } catch (e) {
    //   // Handle error
    //   print('tessss');

    //   print('Error: $e');
    // }
  }
}
