import 'package:capstone_project_tripease/features_profile/api/user_profile_service.dart';
import 'package:flutter/material.dart';

class UserProfileProvider extends ChangeNotifier {
  Future<void> getUserDetail() async {
    notifyListeners();
    try {
      final result = await UserProfileService().getUserDetailWithHttp();
      debugPrint('result: $result');
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
  }
}
