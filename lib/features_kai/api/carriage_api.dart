import 'package:dio/dio.dart';
import '../model/carriage_model.dart';

class CarriageRepo {
  final Dio dio = Dio();

  Future<CarriageModel> fetchCarriage(
      {required int trainId,
      String? trainClass,
      String? date,
      String? status,
      int? page,
      int? limit}) async {
    final response = await dio.get(
        'https://api.tripease.my.id/api/v1/public/train-carriage',
        queryParameters: {
          'train_id': trainId,
          'class': trainClass,
          'date': date,
          'status': status,
          'page': page,
          'limit': 9999
        });
    if (response.statusCode == 200) {
      final data = CarriageModel.fromJson(response.data);
      return data;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
