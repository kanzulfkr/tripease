import 'package:dio/dio.dart';

import '../../model/train/train_order_model.dart';

class TrainOrderApi {
  final Dio dio = Dio();
  var baseUrl = 'https://api.tripease.my.id/api/v1/user/order/ticket';

  Future<TrainOrderModel> fetchTrainOrder({
    int? pageNumber,
    int? limit,
    String? search,
    String? classTrain,
    String? nameTrain,
    String? orderBy,
    String? status,
  }) async {
    final response = await dio.get(baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODc0OTE4ODQsInJvbGUiOiJ1c2VyIiwidXNlcklkIjo2fQ.42HfICCGWUvz1PK6cYGOhl05wv2N_a4QGw7hHwKDc0M'
        }),
        queryParameters: {
          'page': pageNumber,
          'limit': limit,
          'search': search,
          'class': classTrain,
          'name': nameTrain,
          'order_by': orderBy,
          'status': status,
        });
    if (response.statusCode == 200) {
      final data = TrainOrderModel.fromJson(response.data);
      return data;
    } else {
      throw Exception('Error get data');
    }
  }
}
