import 'package:capstone_project_tripease/features_kai/api/payment_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../model/payment_model.dart';

class PaymentProvider extends ChangeNotifier {
  List<Datum> _payment = [];
  List<Datum> get payment => _payment;

  String _message = '';
  String get message => _message;

  String? _accountNumber;
  String? get getAccountNumber => _accountNumber;

  void setAccountNumber(String accountNumber) {
    _accountNumber = accountNumber;
    notifyListeners();
  }

  Future<void> getPayment() async {
    notifyListeners();
    try {
      final response = await PaymentApi().getPaymentData();
      _payment = response.data;
      notifyListeners();
    } on DioError catch (e) {
      debugPrint('Error : $e');
      if (e.response != null && e.response!.statusCode == 400) {
        final errorMessage = e.response!.data['errors'];
        _message = errorMessage;
      }
      notifyListeners();
    }
  }
}
