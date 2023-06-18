import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/station_model.dart';

class StationApi {
  final Dio _dio = Dio();
  String stationUrl = 'https://api.tripease.my.id/api/v1/public/station';
  var error = '';
  Future<StationResponseModel> getStationData() async {
    final response = await _dio.get(stationUrl);

    if (response.statusCode == 200) {
      debugPrint('StationApi: ${response.data}');
      return StationResponseModel.fromJson(response.data);
    } else if (response.statusCode == 400) {
      error = response.statusMessage.toString();

      print('error: $error');

      return StationResponseModel.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
