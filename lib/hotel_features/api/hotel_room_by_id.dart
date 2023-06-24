import 'package:dio/dio.dart';

import '../detail_kamar/model/hotel_room_detail_model.dart';

class HotelRoomDetailApi {
  final Dio dio = Dio();

  Future<DetailHotelRoomModel> hotelRoomDetail(
    int id,
  ) async {
    final response = await dio
        .get('https://api.tripease.my.id/api/v1/public/hotel-room/$id');
    if (response.statusCode == 200) {
      print('data hotel room detail: ${response.data}');
      final data = DetailHotelRoomModel.fromJson(response.data);
      return data;
    } else {
      throw Exception('gagal get data');
    }
  }
}
