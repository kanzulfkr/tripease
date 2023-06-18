import 'package:capstone_project_tripease/onboard_feature/utils/token_manager.dart';
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
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODcxNjI2OTIsInJvbGUiOiJ1c2VyIiwidXNlcklkIjo0fQ.9-e580U-3lf_15UExjgqyQszfYtudNyaSPk62KAe4mg'
      }),
      queryParameters: {
        'station_origin_id': stationOriginId,
        'station_destination_id': stationDestinationId,
        'sort_by_train_id': trainId,
        'sort_by_class': trainClass,
        'sort_by_price': price,
        'sort_by_arrive_time': arriveTime
        // Add more query parameters as needed
      },
    );

    if (response.statusCode == 200) {
      print('DepartureApi: ${response.data}');
      final data = DepartureResponseModel.fromJson(response.data);
      return data; // Return the filtered data
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
