import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../payment_result/model/payment_by_id.dart';

class PaymentByIdApi {
  final Dio dio = Dio();

  Future<PaymentByIdHotelModel> getPaymentById(int id) async {
    final response =
        await dio.get('https://api.tripease.my.id/api/v1/public/payment/$id');

    if (response.statusCode == 200) {
      debugPrint('data payment by id: ${response.data}');
      final data = PaymentByIdHotelModel.fromJson(response.data);
      return data;
    } else {
      throw Exception('gagal get data');
    }
  }
}
