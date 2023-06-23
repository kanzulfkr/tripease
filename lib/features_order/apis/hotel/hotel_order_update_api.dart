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
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODc1OTQzMjIsInJvbGUiOiJ1c2VyIiwidXNlcklkIjo2fQ.5gW2G3P9VZLtBccpYvQrvrEQFxV4_Mtfue_QzIQSi9s'
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
