import 'package:dio/dio.dart';
import '../model/order_train_model.dart';

class OrderTrainApi {
  Dio dio = Dio();

  Future<PostOrderTrainModel> postOrderTrain(PostOrderTrainModel order) async {
    try {
      final url = 'https://api.tripease.my.id/api/v1/user/train/order';

      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODcxNjI2OTIsInJvbGUiOiJ1c2VyIiwidXNlcklkIjo0fQ.9-e580U-3lf_15UExjgqyQszfYtudNyaSPk62KAe4mg'
      };

      final body = order.toJson();

      final response =
          await dio.post(url, options: Options(headers: headers), data: body);

      print(response.statusCode);

      if (response.statusCode == 201) {
        print('Response ORDER : ${response.data}');
        return PostOrderTrainModel.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error ORDER : $e');
      throw Exception('Failed to load data catch');
    }
  }
}
