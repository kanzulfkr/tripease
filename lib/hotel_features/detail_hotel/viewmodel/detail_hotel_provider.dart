import 'package:flutter/material.dart';

import '../../api/hotel_by_id.dart';
import '../model/detail_hotel.dart';

class DetailHotelProvider with ChangeNotifier {
  Data _detailHotel = Data();
  Data get detailHotel => _detailHotel;

  Future<void> getDetailHotel(int id) async {
    try {
      final response = await HotelDetailApi().hotelDetail(id);
      _detailHotel = response.data!;
      notifyListeners();
    } catch (e) {
      print('error: ${e}');
    }
  }
}
