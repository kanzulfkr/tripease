import 'package:capstone_project_tripease/features_kai/model/response_order_train_model.dart';
import 'package:dio/dio.dart';

import '../../features_onboard/utils/token_manager.dart';

class ResponseOrderTrainApi {
  Dio dio = Dio();

  Future<ResponseOrderTrainModel> fetchOrderDetail({
    required int ticketOrderId,
    required int trainId,
  }) async {
    String? tokens = await TokenManager.getToken();

    final response = await dio.get(
      'https://api.tripease.my.id/api/v1/user/order/ticket/detail',
      options: Options(headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens'
      }),
      queryParameters: {
        'ticket_order_id': ticketOrderId,
        'train_id': trainId,
      },
    );

    if (response.statusCode == 200) {
      print('response order api : ${response.data}');
      final data = ResponseOrderTrainModel.fromJson(response.data);
      return data;
    } else if (response.statusCode == 400) {
      print('response order api : ${response}');
      return response.data;
    } else if (response.statusCode == 401) {
      print('response order api : ${response}');
      return response.data;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
