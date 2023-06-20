import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../api/order_train_api.dart';
import '../../model/order_train_model.dart';

class PostOrderTrainProvider with ChangeNotifier {
  String _statusCode = '';
  String get getStatusCode => _statusCode;

  int _ticketOrderId = 0;
  int get getTicketOrderId => _ticketOrderId;

  String? _email;
  String? get getEmail => _email;

  String? _name;
  String? get getName => _name;

  String? _phoneNumber;
  String? get getPhoneNumber => _phoneNumber;

  int? _totalPrice;
  int? get getTotalPrice => _totalPrice;

  int? _paymentId;
  int? get getPaymentId => _paymentId;

  String? _arrivalTime;
  String? get getArrivalTime => _arrivalTime;

  String? _depatureTime;
  String? get getDepatureTime => _depatureTime;

  int _quantityAdult = 0;
  int get getQuantityAdult => _quantityAdult;

  int _quantityInfant = 0;
  int get getQuantityInfant => _quantityInfant;

  List<TicketTravelerDetail>? _ticketTravelerDetail = [];
  List<TicketTravelerDetail>? get getTicketTravelerDetail =>
      _ticketTravelerDetail;

  List<TicketTravelerDetail>? _ticketTravelerDetailReturn;
  List<TicketTravelerDetail>? get getTicketTravelerDetailReturn =>
      _ticketTravelerDetailReturn;

  List<TravelerDetail>? travelerDetail = [];

  bool? _withReturn;
  bool? get getWithReturn => _withReturn;

  void setArrivalTime(String arrivalTime) {
    _arrivalTime = arrivalTime;
    notifyListeners();
  }

  void setDepatureTime(String depatureTime) {
    _depatureTime = depatureTime;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }

  void setTotalPrice(int? totalPrice) {
    _totalPrice = totalPrice;
    notifyListeners();
  }

  void setPaymentId(int? paymentId) {
    _paymentId = paymentId;
    notifyListeners();
  }

  void setQuantityAdult(int quantityAdult) {
    _quantityAdult = quantityAdult;
    notifyListeners();
  }

  void setQuantityInfant(int quantityInfant) {
    _quantityInfant = quantityInfant;
    notifyListeners();
  }

  void setTicketTravelerDetailDeparture(
      List<TicketTravelerDetail> ticketTravelerDetail) {
    _ticketTravelerDetail = ticketTravelerDetail;
    notifyListeners();
  }

  void setTicketTravelerDetailReturn(
      List<TicketTravelerDetail> ticketTravelerDetailReturn) {
    _ticketTravelerDetailReturn = ticketTravelerDetailReturn;
    notifyListeners();
  }

  void addTicketTravelDetail(TicketTravelerDetail ticketDetail) {
    getTicketTravelerDetail!.add(ticketDetail);
    notifyListeners();
  }

  void updateTravelerTitle(int index, String? title) {
    if (index >= 0 && index < travelerDetail!.length) {
      travelerDetail?[index].title = title;
      notifyListeners();
    }
  }

  void setWithReturn(bool withReturn) {
    _withReturn = withReturn;
    notifyListeners();
  }

  Future<void> postOrderTrain(PostOrderTrainModel order) async {
    try {
      final response = await OrderTrainApi().postOrderTrain(order);
      _statusCode = response.data['status_code'].toString();

      _ticketOrderId = response.data['data']['ticket_order_id'];

      // print('ticket_order_id');
      // print(response.data['data']['ticket_order_id']);
      // print('ini response full nya');
      // print(response.data);
      notifyListeners();
    } on DioError catch (e) {
      final code = e.response!.statusCode;
      _statusCode = code.toString();
      notifyListeners();
    }
  }
}
