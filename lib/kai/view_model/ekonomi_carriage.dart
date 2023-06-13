import 'package:flutter/material.dart';

class EkonomiCarriage extends ChangeNotifier {
  List<bool> isTappedOne = [];
  List<bool> isTappedTwo = [];
  List<bool> isTappedThree = [];
  List<bool> isTappedFour = [];
  List<bool> isTappedFive = [];

  EkonomiCarriage() {
    isTappedOne = List.generate(22, (index) => false);
    isTappedTwo = List.generate(22, (index) => false);
    isTappedThree = List.generate(22, (index) => false);
    isTappedFour = List.generate(22, (index) => false);
    isTappedFive = List.generate(22, (index) => false);
  }

  void toggleIsTappedOne(int index) {
    isTappedOne[index] = !isTappedOne[index];
    notifyListeners();
  }

  // Implementasikan metode toggle untuk isTappedTwo, isTappedThree, isTappedFour, dan isTappedFive

  // ...
}
