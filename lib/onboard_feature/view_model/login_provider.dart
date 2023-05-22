import 'package:flutter/material.dart';

import '../api/user_api.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLogin = false;

  bool get isLogin => _isLogin;

  void setLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }

  void setLogout() {
    _isLogin = false;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    notifyListeners();
    try {
      final result = await UserApi().login(email, password);

      debugPrint('result: $result');
      notifyListeners();
    } catch (e) {
      print('Error : $e');
      notifyListeners();
    }
  }
}
