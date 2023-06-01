// ignore_for_file: avoid_print
import 'dart:io';
import 'package:capstone_project_tripease/features_profile/api/user_profile_service.dart';
import 'package:capstone_project_tripease/features_profile/model/user_profile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// enum UpdateStatus { empty, loading, success, error }
// enum UpdatePassword { empty, loading, success, error }

class UserProfileProvider extends ChangeNotifier {
  Data? result;
  bool loading = false;

  // UpdateStatus _updateStatus = UpdateStatus.empty;
  // UpdateStatus get updateStatus => _updateStatus;
  // UpdatePassword _updatePassword = UpdatePassword.empty;
  // UpdatePassword get updatePassword => _updatePassword;

  String _statusCode = '';
  String get statusCode => _statusCode;

  Future<void> getUserProfile() async {
    loading = true;
    notifyListeners();
    result = (await UserProfileService().getUser())!;
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

  // Future<void> updateUserProfile(String fullName, String phoneNumber,
  //     String birthDate, String citizen) async {
  //   _updateStatus = UpdateStatus.loading;
  //   notifyListeners();

  //   try {
  //     await UserProfileService()
  //         .updateUser(fullName, phoneNumber, birthDate, citizen);

  //     _updateStatus = UpdateStatus.success;
  //     notifyListeners();
  //   } on DioError catch (e) {
  //     print('Error : $e');
  //     _updateStatus = UpdateStatus.error;
  //     notifyListeners();
  //   }
  // }

  Future<void> updateUserPassword(
      String oldPassword, String newPassword, String confirmPassword) async {
    // _updatePassword = UpdatePassword.loading;
    // notifyListeners();
    try {
      await UserProfileService()
          .updatePassword(oldPassword, newPassword, confirmPassword);
      // _updatePassword = UpdatePassword.success;
      notifyListeners();
    } on DioError catch (e) {
      print('Error : $e');
      if (e.response != null && e.response!.statusCode == 400) {
        final statusCode = e.response!.data[
            'status_code']; // Assuming the response body contains a 'message' field

        _statusCode = statusCode.toString();
        notifyListeners();
      }

      // _updatePassword = UpdatePassword.error;
    }
  }
}
