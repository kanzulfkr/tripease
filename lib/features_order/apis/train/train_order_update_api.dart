import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../model/train/train_order_model.dart';

class TrainOrderUpdateApi {
  final Dio dio = Dio();
  final baseUrl = 'https://api.tripease.my.id/api/v1/user/train/order';

  Future<TrainOrderModel> updateOrderStatus(
    int? ticketOrderId,
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
          'ticket_order_id': ticketOrderId,
          'status': status,
        });
    if (response.statusCode == 200) {
      final data = TrainOrderModel.fromJson(response.data);
      return data;
    } else {
      throw Exception('Error get data');
    }
  }
}
