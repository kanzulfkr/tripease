import '/features_order/apis/hotel/hotel_order_update_api.dart';
import '/features_order/model/hotel/hotel_order_model.dart';
import 'package:flutter/material.dart';

import '../../../apis/train/train_order_update_api.dart';
import '../../../model/train/train_order_model.dart';

class StatusOrderTrainUpdateProvider with ChangeNotifier {
  final TrainOrderUpdateApi _api = TrainOrderUpdateApi();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> updateOrderStatus(int? ticketOrderId, String? status) async {
    try {
      _isLoading = true;
      notifyListeners();

      final TrainOrderModel response =
          await _api.updateOrderStatus(ticketOrderId!, status!);

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
