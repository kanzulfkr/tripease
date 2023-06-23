import 'package:dio/dio.dart';

import '../../model/train/train_order_model.dart';

class TrainOrderFilter {
  final Dio dio = Dio();
  var baseUrl = 'https://api.tripease.my.id/api/v1/user/order/ticket';

  Future<TrainOrderModel> fetchTrainFilterOrder({
    String? classTrain,
  }) async {
    final response = await dio.get(baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODc1OTQzMjIsInJvbGUiOiJ1c2VyIiwidXNlcklkIjo2fQ.5gW2G3P9VZLtBccpYvQrvrEQFxV4_Mtfue_QzIQSi9s'
        }),
        queryParameters: {
          'class': classTrain,
        });
    if (response.statusCode == 200) {
      final data = TrainOrderModel.fromJson(response.data);
      return data;
    } else {
      throw Exception('Error get data');
    }
  }
}
