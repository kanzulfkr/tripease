import 'package:capstone_project_tripease/features_kai/model/response_order_train_model.dart';
import 'package:dio/dio.dart';

class ResponseOrderTrainApi {
  Dio dio = Dio();

  Future<ResponseOrderTrainModel> fetchOrderDetail({
    required int ticketOrderId,
    required int trainId,
  }) async {
    final response = await dio.get(
      'https://api.tripease.my.id/api/v1/user/order/ticket/detail',
      options: Options(headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODcyMjUxNzksInJvbGUiOiJ1c2VyIiwidXNlcklkIjo0fQ.8xKbX3FopSjTH8fC6bjp4l24hvoM-Qyy0_oMpW8SH7E'
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
