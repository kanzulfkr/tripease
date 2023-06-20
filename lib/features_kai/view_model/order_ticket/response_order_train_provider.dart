import 'package:capstone_project_tripease/features_kai/api/response_order_train_api.dart';
import 'package:flutter/material.dart';
import '../../model/response_order_train_model.dart';

class ResponseOrderTrainProvider with ChangeNotifier {
  ResponseDataOrder _dataOrder = ResponseDataOrder();
  ResponseDataOrder get dataOrder => _dataOrder;

  Future<void> getResponseOrder(ticketOrderId, trainId) async {
    try {
      final response = await ResponseOrderTrainApi()
          .fetchOrderDetail(ticketOrderId: ticketOrderId, trainId: trainId);
      _dataOrder = response.data!;
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }
}
