import 'package:flutter/material.dart';

class SelectedSeatsDepartureProvider extends ChangeNotifier {
  List<int?> selectedSeats = [];

  void selectSeat(int? idSeat) {
    selectedSeats.add(idSeat);
    notifyListeners();
  }

  void deselectSeat(int? idSeat) {
    selectedSeats.remove(idSeat);
    notifyListeners();
  }

  void clearSelectedSeats() {
    selectedSeats.clear();
    notifyListeners();
  }

  bool _isConfirmed = false;
  bool get isConfirmed => _isConfirmed;

  void confirmSelectedSeats() {
    _isConfirmed = !_isConfirmed;
    notifyListeners();
  }
}
