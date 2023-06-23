import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../onboard_feature/utils/token_manager.dart';
import '../payment_result/model/patch_order_model.dart';

class PatchOrderApi {
  final Dio dio = Dio();

  Future<PatchOrderHotelResponseModel> patchOrder(
      {required int hotelId, required String status}) async {
    String? tokens = await TokenManager.getToken();
    final response =
        await dio.patch('https://api.tripease.my.id/api/v1/user/hotel/order',
            options: Options(headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $tokens'
            }),
            queryParameters: {'hotel_order_id': hotelId, 'status': status});
    if (response.statusCode == 201) {
      debugPrint('patch result: ${response.data}');
      final data = PatchOrderHotelResponseModel.fromJson(response.data);
      return data;
    } else {
      throw Exception('gagal patch');
    }
  }
}
