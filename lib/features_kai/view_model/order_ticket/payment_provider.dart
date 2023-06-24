import 'package:capstone_project_tripease/features_kai/api/payment_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../model/payment_model.dart';

class PaymentProvider extends ChangeNotifier {
  List<Datum> _payment = [];
  List<Datum> get payment => _payment;

  String _message = '';
  String get message => _message;

  int? _paymentId;
  int? get getPaymentId => _paymentId;

  String _paymentName = '';
  String get getPaymentName => _paymentName;

  String? _paymentAccNumber;
  String? get getAccountNumber => _paymentAccNumber;

  String? _paymentImageUrl;
  String? get getImageUrl => _paymentImageUrl;

  void setDataPayment(int paymentId, String paymentName, String paymentImageUrl,
      String paymentNumber) {
    _paymentId = paymentId;
    _paymentName = paymentName;
    _paymentImageUrl = paymentImageUrl;
    _paymentAccNumber = paymentNumber;
  }

  Future<void> getPayment() async {
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
