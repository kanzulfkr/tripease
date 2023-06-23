import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../model/hotel/hotel_order_model.dart';

class HotelOrderUpdateApi {
  final Dio dio = Dio();
  final baseUrl = 'https://api.tripease.my.id/api/v1/user/hotel/order';

  Future<HotelOrderModel> updateOrderStatus(
    int? hotelOrderId,
    String? status,
  ) async {
    final response = await dio.patch(baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODc1NzU5MjUsInJvbGUiOiJ1c2VyIiwidXNlcklkIjo2fQ.DgywxP8D7pO6w8AzP2yXuOh_I624nhxHX_ntc5GYFyw'
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
