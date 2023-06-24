import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../api/user_api.dart';

enum LoginStatus { empty, loading, success, error }

class LoginProvider extends ChangeNotifier {
  LoginStatus _loginStatus = LoginStatus.empty;
  LoginStatus get loginStatus => _loginStatus;

  bool _isLogin = false;

  bool get isLogin => _isLogin;

  String _message = '';
  String get message => _message;

  String _error = '';
  String get error => _error;

  void setLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }

  void setLogout() {
    _isLogin = false;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    _loginStatus = LoginStatus.loading;
    notifyListeners();
    try {
      final result = await UserApi().login(email, password);

      debugPrint('result: $result');
      _loginStatus = LoginStatus.success;
      notifyListeners();
    } on DioError catch (e) {
      print('Error : $e');
      if (e.response != null && e.response!.statusCode == 400) {
        final errorMessage = e.response!.data[
            'errors']; // Assuming the response body contains a 'message' field

        _message = errorMessage;
      }

      _loginStatus = LoginStatus.error;

      notifyListeners();
    }
  }
}
