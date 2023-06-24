import 'package:dio/dio.dart';

import '../../../features_onboard/utils/token_manager.dart';
import '../../model/train/train_order_model.dart';

class TrainOrderFilter {
  final Dio dio = Dio();
  var baseUrl = 'https://api.tripease.my.id/api/v1/user/order/ticket';

  Future<TrainOrderModel> fetchTrainFilterOrder({
    String? classTrain,
  }) async {
    String? tokens = await TokenManager.getToken();
    final response = await dio.get(baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokens'
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
