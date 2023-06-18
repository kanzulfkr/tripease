import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/payment_model.dart';

class PaymentApi {
  final Dio _dio = Dio();
  String baseUrl = 'https://api.tripease.my.id/api/v1/public/payment';

  var error = '';
  Future<PaymentResponseModel> getPaymentData() async {
    final response = await _dio.get(baseUrl);
    if (response.statusCode == 200) {
      debugPrint('StationApi: ${response.data}');

      return PaymentResponseModel.fromJson(response.data);
    } else if (response.statusCode == 400) {
      error = response.statusMessage.toString();
      print('error: $error');
      return PaymentResponseModel.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
