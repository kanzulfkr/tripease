import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../features_onboard/utils/token_manager.dart';
import '../../model/hotel/hotel_order_model.dart';

class HotelOrderUpdateApi {
  final Dio dio = Dio();
  final baseUrl = 'https://api.tripease.my.id/api/v1/user/hotel/order';

  Future<HotelOrderModel> updateOrderStatus(
    int? hotelOrderId,
    String? status,
  ) async {
    String? tokens = await TokenManager.getToken();
    final response = await dio.patch(baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokens'
        }),
        queryParameters: {
          'hotel_order_id': hotelOrderId,
          'status': status,
        });
    if (response.statusCode == 200) {
      final data = HotelOrderModel.fromJson(response.data);
      return data;
    } else {
      throw Exception('Error get data');
    }
  }
}
