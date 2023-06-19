import 'package:dio/dio.dart';
import '../model/order_train_model.dart';

class OrderTrainApi {
  Dio dio = Dio();

  Future<dynamic> postOrderTrain(PostOrderTrainModel order) async {
    const url = 'https://api.tripease.my.id/api/v1/user/train/order';

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODcyMjUxNzksInJvbGUiOiJ1c2VyIiwidXNlcklkIjo0fQ.8xKbX3FopSjTH8fC6bjp4l24hvoM-Qyy0_oMpW8SH7E'
    };
    final body = order.toJson();

    final response =
        await dio.post(url, options: Options(headers: headers), data: body);
    return response;
    // PostOrderTrainModel.fromJson(response.data['data']);
    // return response.statusCode.toString();
  }
}
