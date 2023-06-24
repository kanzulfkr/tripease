import 'package:dio/dio.dart';

import '../../onboard_feature/utils/token_manager.dart';
import '../detail_hotel/model/detail_hotel.dart';

class HotelDetailApi {
  final Dio dio = Dio();

  Future<DetailHotelModel> hotelDetail(
    int id,
  ) async {
    String? tokens = await TokenManager.getToken();
    final response = await dio.get(
      'https://api.tripease.my.id/api/v1/public/hotel/$id',
      options: Options(headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens'
      }),
    );
    if (response.statusCode == 200) {
      print('data hotel detail: ${response.data}');
      final data = DetailHotelModel.fromJson(response.data);
      return data;
    } else {
      throw Exception('gagal get data');
    }
  }
}
