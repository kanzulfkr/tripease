import '../../../features_onboard/utils/token_manager.dart';
import '/features_order/model/train/train_order_model.dart';
import 'package:dio/dio.dart';

class TrainOrderSearch {
  final Dio dio = Dio();
  var baseUrl = 'https://api.tripease.my.id/api/v1/user/order/ticket';

  Future<TrainOrderModel> fetchTrainOrderSearch({
    String? name,
  }) async {
    String? tokens = await TokenManager.getToken();
    final response = await dio.get(baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokens'
        }),
        queryParameters: {
          'name': name,
        });
    if (response.statusCode == 200) {
      final data = TrainOrderModel.fromJson(response.data);
      return data;
    } else {
      throw Exception('Error get data');
    }
  }
}
