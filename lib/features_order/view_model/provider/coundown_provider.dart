import 'package:flutter/foundation.dart';

class CountdownProvider with ChangeNotifier {
  int _endTime;

  CountdownProvider(this._endTime);

  int get endTime => _endTime;

  set endTime(int value) {
    _endTime = value;
    notifyListeners();
  }
}
