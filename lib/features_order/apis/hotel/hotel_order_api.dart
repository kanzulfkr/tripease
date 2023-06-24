import 'package:dio/dio.dart';

import '../../../features_onboard/utils/token_manager.dart';
import '../../model/hotel/hotel_order_model.dart';

class HotelOrderApi {
  final Dio dio = Dio();
  var baseUrl = 'https://api.tripease.my.id/api/v1/user/order/hotel';

  Future<HotelOrderModel> fetchHotelOrder({
    int? pageNumber,
    int? limit,
    String? search,
    String? nameHotel,
    String? addressHotel,
    String? orderDateHotel,
    String? orderBy,
    String? status,
  }) async {
    String? tokens = await TokenManager.getToken();
    final response = await dio.get(baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokens'
        }),
        queryParameters: {
          'page': pageNumber,
          'limit': limit,
          'search': search,
          'name': nameHotel,
          'address': addressHotel,
          'order_date': orderDateHotel,
          'order_by': orderBy,
          'status': status,
        });
    if (response.statusCode == 200) {
      final data = HotelOrderModel.fromJson(response.data);
      return data;
    } else {
      throw Exception('Error get data');
    }
  }
}