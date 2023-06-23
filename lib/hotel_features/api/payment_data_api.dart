import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../payment_hotel/model/payment_model.dart';

class PaymentApi {
  final Dio dio = Dio();

  Future<PaymentHotelModel> getPaymentData() async {
    final response =
        await dio.get('https://api.tripease.my.id/api/v1/public/payment');

    if (response.statusCode == 200) {
      debugPrint('data payment: ${response.data}');
      final data = PaymentHotelModel.fromJson(response.data);
      return data;
    } else {
      throw Exception('gagal get data');
    }
  }
}
