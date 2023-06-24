import 'package:flutter/material.dart';

import '../../api/order_hotel.dart';
import '../model/data_order_response_model.dart';
import '../model/order_model.dart';

class OrderProviderHotel with ChangeNotifier {
  Data data = Data();

  Future<void> postOrderHotel(PostOrderModel order) async {
    try {
      final result = await OrderHotelApi().postOrderHotel(order);
      data = result.data!;
      notifyListeners();
    } catch (e) {
      debugPrint('ERROR ORDER HOTEL: $e');
      throw Exception('gagal post data');
    }
  }
}
