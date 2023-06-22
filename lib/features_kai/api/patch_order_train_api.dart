import 'package:capstone_project_tripease/features_kai/model/response_order_train_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../onboard_feature/utils/token_manager.dart';
import '../model/patch_order_model.dart';

class PatchOrderTrainApi {
  Dio dio = Dio();

  Future<PatchOrderModel> patchOrder(
      {required int ticketOrderId, required String status}) async {
    String? tokens = await TokenManager.getToken();

    final response = await dio.patch(
        'https://api.tripease.my.id/api/v1/user/train/order',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokens'
        }),
        queryParameters: {'ticket_order_id': ticketOrderId, 'status': status});

    if (response.statusCode == 201) {
      debugPrint('patch result: ${response.data}');
      final data = PatchOrderModel.fromJson(response.data);
      return data;
    } else {
      throw Exception('gagal patch');
    }
  }
}
