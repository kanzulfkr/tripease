import 'package:dio/dio.dart';
import '../model/depature_model.dart';

class DepartureRepository {
  final Dio dio = Dio();

  Future<DepartureResponseModel> fetchDepartures(
      {required int stationOriginId,
      required int stationDestinationId,
      int? trainId,
      String? trainClass,
      String? price,
      String? arriveTime

      // Add more query parameters as needed
      }) async {
    final response = await dio.get(
      'https://api.tripease.my.id/api/v1/user/train/search',
      options: Options(headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODcyMjUxNzksInJvbGUiOiJ1c2VyIiwidXNlcklkIjo0fQ.8xKbX3FopSjTH8fC6bjp4l24hvoM-Qyy0_oMpW8SH7E'
      }),
      queryParameters: {
        'station_origin_id': stationOriginId,
        'station_destination_id': stationDestinationId,
        'sort_by_train_id': trainId,
        'sort_by_class': trainClass,
        'sort_by_price': price,
        'sort_by_arrive_time': arriveTime
      },
    );

    if (response.statusCode == 200) {
      print('DepartureApi: ${response.data}');
      final data = DepartureResponseModel.fromJson(response.data);
      return data;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
