import 'package:flutter/material.dart';

import '../../api/payment_by_id.dart';
import '../model/payment_by_id.dart';

class DetailPaymentProvider with ChangeNotifier {
  Data _detailPayment = Data();
  Data get detailPayment => _detailPayment;

  Future<void> getDetailPayment(int id) async {
    try {
      final response = await PaymentByIdApi().getPaymentById(id);
      _detailPayment = response.data!;
      notifyListeners();
    } catch (e) {
      print('error: ${e}');
    }
  }
}
