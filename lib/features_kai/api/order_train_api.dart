import 'package:dio/dio.dart';
import '../../features_onboard/utils/token_manager.dart';
import '../model/order_train_model.dart';

class OrderTrainApi {
  Dio dio = Dio();

  Future<dynamic> postOrderTrain(PostOrderTrainModel order) async {
    String? tokens = await TokenManager.getToken();
    const url = 'https://api.tripease.my.id/api/v1/user/train/order';

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $tokens'
    };
    final body = order.toJson();

    final response =
        await dio.post(url, options: Options(headers: headers), data: body);
    return response;
    // PostOrderTrainModel.fromJson(response.data['data']);
    // return response.statusCode.toString();
  }
}
