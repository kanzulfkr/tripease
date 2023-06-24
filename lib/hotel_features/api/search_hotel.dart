import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../onboard_feature/utils/token_manager.dart';
import '../hotel_home/model/search_hotel.dart';

class SearchHotelAPI {
  final Dio dio = Dio();
  Future<HotelSearch> searchHotel({
    int? page,
    int? limit,
    int? minimumPrice,
    int? maximumPrice,
    int? ratingClass,
    String? address,
    String? name,
    String? sortByPrice,
  }) async {
    String? tokens = await TokenManager.getToken();
    final response =
        await dio.get('https://api.tripease.my.id/api/v1/user/hotel/search',
            options: Options(headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $tokens'
            }),
            queryParameters: {
          'page': page,
          'limit': limit,
          'minimun_price': minimumPrice,
          'maximum_price': maximumPrice,
          'rating_class': ratingClass,
          'address': address,
          'name': name,
          'sort_by_price': sortByPrice
        });
    if (response.statusCode == 200) {
      debugPrint('search result: ${response.data}');
      final data = HotelSearch.fromJson(response.data);
      return data;
    } else {
      throw Exception('gagal search');
    }
  }
}
