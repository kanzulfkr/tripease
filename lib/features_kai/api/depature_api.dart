import 'package:dio/dio.dart';
import '../../onboard_feature/utils/token_manager.dart';
import '../model/depature_model.dart';

class DepartureRepository {
  final Dio dio = Dio();

  Future<DepartureResponseModel> fetchDepartures({
    required int stationOriginId,
    required int stationDestinationId,
    int? trainId,
    String? trainClass,
    String? price,
    String? arriveTime,
  }) async {
    String? tokens = await TokenManager.getToken();

    final response = await dio.get(
      'https://api.tripease.my.id/api/v1/user/train/search',
      options: Options(headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens'
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
      // if (response.data.isNull) {
      //   print('null');
      // }else{
      //   p
      // }
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
