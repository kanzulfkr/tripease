import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  int? _activeTabIndex;

  int? get activeTabIndex => _activeTabIndex;

  void setActiveTabIndex(int? index) {
    _activeTabIndex = index!;
  }

  @override
  notifyListeners();
}
