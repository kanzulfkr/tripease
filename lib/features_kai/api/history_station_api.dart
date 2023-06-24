import 'package:dio/dio.dart';
import '../../features_onboard/utils/token_manager.dart';

import '../model/history_station_model.dart';

class HistoryStationApi {
  final Dio dio = Dio();
  String baseUrl = 'https://api.tripease.my.id/api/v1/public/payment';

  Future<HistorySearchStation> getHistoryStation() async {
    String? tokens = await TokenManager.getToken();

    final response = await dio.get(
      'https://api.tripease.my.id/api/v1/user/history-seen-station',
      options: Options(headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens'
      }),
    );

    if (response.statusCode == 200) {
      print('DepartureApi: ${response.data}');
      final data = HistorySearchStation.fromJson(response.data);
      return data;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
