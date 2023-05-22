import '/onboard_feature/model/register_model.dart';
import 'package:flutter/material.dart';

import '../api/user_api.dart';

class RegisterProvider extends ChangeNotifier {
  String _confirmPassword = '';
  String _email = '';
  String _fullName = '';
  String _password = '';
  String _phoneNumber = '';

  String get confirmPassword => _confirmPassword;
  String get email => _email;
  String get fullName => _fullName;
  String get password => _password;
  String get phoneNumber => _phoneNumber;

  void setConfirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setFullName(String value) {
    _fullName = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  Future<void> register(UserRegisterResponseModel registerData) async {
    notifyListeners();
    try {
      final result = await UserApi().register(registerData);

      debugPrint('result: $result');
      notifyListeners();
    } catch (e) {
      print('Error : $e');
      notifyListeners();
    }
  }
}
