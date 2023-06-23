import 'package:flutter/material.dart';

import '../../api/payment_data_api.dart';
import '../model/payment_model.dart';

class PaymentHotelProvider with ChangeNotifier {
  int _paymentId = 0;
  int get paymentId => _paymentId;

  String? _paymentType;
  String? get paymentType => _paymentType;

  List<Datum> _payment = [];
  List<Datum> get payment => _payment;

  List<Datum> _pulsaPayments = [];
  List<Datum> get pulsaPayments => _pulsaPayments;

  List<Datum> _virtualAccountPayments = [];
  List<Datum> get virtualAccountPayments => _virtualAccountPayments;

  List<Datum> _miniMarketPayments = [];
  List<Datum> get miniMarketPayments => _miniMarketPayments;

  List<Datum> _creditCardPayments = [];
  List<Datum> get creditCardPayments => _creditCardPayments;

  void setPaymentId(int value) {
    _paymentId = value;
    notifyListeners();
  }

  void setPaymentType(String? value) {
    _paymentType = value;
    notifyListeners();
  }

  int? _indexPayment;
  int? get indexPayment => _indexPayment;

  Future<void> getPaymentData() async {
    try {
      final response = await PaymentApi().getPaymentData();
      _payment = response.data ?? [];

      _pulsaPayments =
          _payment.where((payment) => payment.type == 'pulsa').toList();
      _virtualAccountPayments = _payment
          .where((payment) => payment.type == 'Virtual Account')
          .toList();
      _miniMarketPayments =
          _payment.where((payment) => payment.type == 'mini market').toList();
      _creditCardPayments =
          _payment.where((payment) => payment.type == 'credit card').toList();

      print('VA: ${_virtualAccountPayments.length}');
      notifyListeners();
    } catch (e) {
      print('error: ${e}');
    }
  }
}
