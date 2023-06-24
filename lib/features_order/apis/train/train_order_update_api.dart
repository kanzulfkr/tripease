import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../features_onboard/utils/token_manager.dart';
import '../../model/train/train_order_model.dart';

class TrainOrderUpdateApi {
  final Dio dio = Dio();
  final baseUrl = 'https://api.tripease.my.id/api/v1/user/train/order';

  Future<TrainOrderModel> updateOrderStatus(
    int? ticketOrderId,
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
