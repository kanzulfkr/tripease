import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel_1/features_home/models/hotel_seen_model.dart';
import 'package:hotel_1/onboard_feature/utils/token_manager.dart';

class HotelSeenApi {
  final Dio dio = Dio();

  Future<HotelSeenModel> getHotelSeen() async {
    String? tokens = await TokenManager.getToken();
    final response = await dio.get(
      'https://api.tripease.my.id/api/v1/user/history-seen-hotel',
      options: Options(headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens'
      }),
    );
    if (response.statusCode == 200) {
      debugPrint('data hotel seen: ${response.data}');
      final data = HotelSeenModel.fromJson(response.data);
      return data;
    } else {
      throw Exception('gagal get data');
    }
  }
}
