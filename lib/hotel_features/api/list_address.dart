import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../hotel_home/model/list_address.dart';

class ListAddressAPI {
  final Dio dio = Dio();
  Future<ListAddress> addressList() async {
    final response =
        await dio.get('https://api.tripease.my.id/api/v1/public/hotel');
    if (response.statusCode == 200) {
      print('data address: ${response.data}');
      final data = ListAddress.fromJson(response.data);
      return data;
    } else {
      throw Exception('gagal get data');
    }
  }

  Future<ListAddress> getRecommendation(bool recommendation) async {
    final response = await dio.get(
        'https://api.tripease.my.id/api/v1/public/hotel',
        queryParameters: {'recommendation': recommendation});
    if (response.statusCode == 200) {
      debugPrint('data recommendation: ${response.data}');
      final data = ListAddress.fromJson(response.data);
      return data;
    } else {
      throw Exception('gagal get data');
    }
  }
}
