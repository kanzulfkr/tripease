import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../features_onboard/utils/token_manager.dart';
import '../payment_hotel/model/data_order_response_model.dart';
import '../payment_hotel/model/order_model.dart';

class OrderHotelApi {
  final Dio dio = Dio();

  Future<PostOrderDataResponseModel> postOrderHotel(
      PostOrderModel order) async {
    String? tokens = await TokenManager.getToken();
    try {
      const url = 'https://api.tripease.my.id/api/v1/user/hotel/order';

      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens'
      };
      final body = order.toJson();
      final response =
          await dio.post(url, data: body, options: Options(headers: headers));

      if (response.statusCode == 201) {
        debugPrint('data order: ${response.data}');
        final data = PostOrderDataResponseModel.fromJson(response.data);
        return data;
      } else {
        throw Exception('gagal post data');
      }
    } catch (e) {
      debugPrint('ERROR ORDER HOTEL: $e');
      throw Exception('gagal post data');
    }
  }
}
