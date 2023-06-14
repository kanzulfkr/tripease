import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  int _activeTabIndex = 0;

  int get activeTabIndex => _activeTabIndex;

  void setActiveTabIndex(int index) {
    _activeTabIndex = index;
  }

  @override
  notifyListeners();
}
