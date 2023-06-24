// ignore_for_file: avoid_print
import 'dart:io';
import '/features_profile/api/user_profile_service.dart';
import '/features_profile/model/user_profile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

enum UpdateStatus { empty, loading, success, error }

class UserProfileProvider extends ChangeNotifier {
  Data? result;
  bool loading = false;

  UpdateStatus _updateStatus = UpdateStatus.empty;
  UpdateStatus get updateStatus => _updateStatus;

  String _statusCode = '';
  String get statusCode => _statusCode;

  Future<void> getUserProfile() async {
    loading = true;
    result = await UserProfileService().getUser();
    loading = false;
    notifyListeners();
  }

  Future<void> deleteProfilePicture() async {
    loading = true;
    notifyListeners();
    await UserProfileService().deletePicture();
    loading = false;
    notifyListeners();
  }

  Future<void> updateProfilePicture(File file, String filename) async {
    loading = true;
    notifyListeners();
    await UserProfileService().updatePhoto(file, filename);
    loading = false;
    notifyListeners();
  }

  Future<void> updateUserProfile(String fullName, String phoneNumber,
      String birthDate, String citizen) async {
    _updateStatus = UpdateStatus.loading;
    notifyListeners();

    try {
      await UserProfileService()
          .updateUser(fullName, phoneNumber, birthDate, citizen);
      _updateStatus = UpdateStatus.success;
      notifyListeners();
    } on DioError catch (e) {
      print('Error : $e');
      _updateStatus = UpdateStatus.error;
      notifyListeners();
    }
  }

  Future<void> updateUserPassword(
      String oldPassword, String newPassword, String confirmPassword) async {
    try {
      final response = await UserProfileService()
          .updatePassword(oldPassword, newPassword, confirmPassword);
      _statusCode = response.toString();
      print("kalo 200 disini : $_statusCode");
      notifyListeners();
    } on DioError catch (e) {
      final code = e.response!.data['status_code'];
      print("kalo 400 disini : ${e.response!.data['status_code']}");
      _statusCode = code.toString();
      notifyListeners();
    }
  }
}
