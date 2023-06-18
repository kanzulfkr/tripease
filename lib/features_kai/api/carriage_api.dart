import 'package:dio/dio.dart';

import '../model/carriage.dart';

class CarriageRepo {
  final Dio dio = Dio();

  Future<TrainCarriageModel> fetchCarriage(
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
          'limit': limit
        });
    if (response.statusCode == 200) {
      print('CarriageApi: ${response.data}');
      final data = TrainCarriageModel.fromJson(response.data);
      return data;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
