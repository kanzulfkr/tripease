import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  int? _activeTabIndex;

  int? get activeTabIndex => _activeTabIndex;

  int _initialIndex = 0;

  int get initialIndex => _initialIndex;

  void setActiveTabIndex(int index) {
    _activeTabIndex = index;
    Future.microtask(() => notifyListeners());
  }

  void setInitialIndex(int? index) {
    _initialIndex = index!;
    notifyListeners();
  }
}
