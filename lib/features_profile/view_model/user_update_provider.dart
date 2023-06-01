import 'package:capstone_project_tripease/features_profile/api/user_profile_service.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

enum UpdateStatus { empty, loading, success, error }

class UserUpdateProvider extends ChangeNotifier {
  UpdateStatus _updateStatus = UpdateStatus.empty;
  UpdateStatus get updateStatus => _updateStatus;

  String _message = '';
  String get message => _message;

  Future<void> updateUser(String fullName, String phoneNumber, String birthDate,
      String citizen) async {
    _updateStatus = UpdateStatus.loading;
    notifyListeners();

    try {
      await UserProfileService()
          .updateUser(fullName, phoneNumber, birthDate, citizen);

      _updateStatus = UpdateStatus.success;
      notifyListeners();
    } on DioError catch (e) {
      print('Error : $e');
      if (e.response != null && e.response!.statusCode == 400) {
        final errorMessage = e.response!.data['errors'];
        _message = errorMessage;
      }

      _updateStatus = UpdateStatus.error;
      notifyListeners();
    }
  }
}
