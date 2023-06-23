import 'package:capstone_project_tripease/features_order/apis/hotel/hotel_order_update_api.dart';
import 'package:capstone_project_tripease/features_order/model/hotel/hotel_order_model.dart';
import 'package:flutter/material.dart';

class StatusOrderHotelUpdateProvider with ChangeNotifier {
  final HotelOrderUpdateApi _api = HotelOrderUpdateApi();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> updateOrderStatus(int? hotelOrderId, String? status) async {
    try {
      _isLoading = true;
      notifyListeners();

      final HotelOrderModel response =
          await _api.updateOrderStatus(hotelOrderId!, status!);

      print(response.data);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print(e);
    }
  }
}
