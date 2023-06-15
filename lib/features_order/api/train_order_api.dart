import 'package:dio/dio.dart';

import '../model/train_model.dart';

class TrainOrderApi {
  final Dio dio = Dio();
  var baseUrl = 'https://capstone.hanifz.com/api/v1/user/order/ticket';

  Future<OrderTrainModel> fetchTrainOrder(
      {int? pageNumber, int? limit, String? status}) async {
    final response = await dio.get(baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODY5MDU2MzcsInJvbGUiOiJ1c2VyIiwidXNlcklkIjo0fQ.L7HkvyUZfCua9ejeKGT2QDdm29yRdqBeanDi4K8h-3A'
        }),
        queryParameters: {
          'page': pageNumber,
          'limit': limit,
          'status': status,
        });
    if (response.statusCode == 200) {
      print('Train Order : ${response.data}');
      final data = OrderTrainModel.fromJson(response.data);
      return data;
    } else {
      throw Exception('Error get data');
    }
  }
}
