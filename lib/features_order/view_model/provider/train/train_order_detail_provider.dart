import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../apis/train/train_order_detail_api.dart';
import '../../../model/train/train_order_detail_model.dart';

class TrainOrderDetailProvider with ChangeNotifier {
  String? nameTrain;
  String? classTrain;
  String? ticketOrderCode;
  String? stationOrigin;
  String? stationDestination;
  String? depatureTime;
  String? arriveTime;
  String? dateTime;
  String? typePayment;
  String? namePayment;
  String? imagePayment;
  int? trainPrice;
  String? createdAt;
  String? updatedAt;
  String? accountName;
  String? accountNumber;
  int? quantityAdult;
  String? quantityInfant;
  String? totalAmount;
  String? nameOrder;
  String? emailOrder;
  String? idNumber;
  String? trainCarriage;
  String? trainSeat;
  int? trainOrderId;

  String? get getNameTrain => nameTrain;
  int? get getTrainOrderId => trainOrderId;
  String? get getIdNumber => idNumber;
  String? get getNameOrder => nameOrder;
  String? get getTrainCarriage => trainCarriage;
  String? get getTrainSeat => trainSeat;
  String? get getEmailOrder => emailOrder;
  String? get getClassTrain => classTrain;
  String? get getTicketOrderCode => ticketOrderCode;
  String? get getStationOrigin => stationOrigin;
  String? get getStationDestination => stationDestination;
  String? get getDepatureTime => depatureTime;
  String? get getArriveTime => arriveTime;
  String? get getDateTime => dateTime;
  String? get getTypePayment => typePayment;
  String? get getNamePayment => namePayment;
  String? get getImagePayment => imagePayment;
  int? get getTrainPrice => trainPrice;
  String? get getCreatedAt => createdAt;
  String? get getUpdatedAt => updatedAt;
  String? get getAccountName => accountName;
  String? get getAccountNumber => accountNumber;
  int? get getQuantityAdult => quantityAdult;
  String? get getQuantityInfant => quantityInfant;
  String? get getTotalAmount => totalAmount;

  Future<void> setNameTrain(String? name) async {
    nameTrain = name;
    notifyListeners();
  }
  Future<void> setIdNumber(String? idCardNumber) async {
    idNumber = idCardNumber;
    notifyListeners();
  }
  Future<void> setTrainCarriage(String? trainC) async {
    trainCarriage = trainC;
    notifyListeners();
  }
  Future<void> setTrainOrderId(int? ticketOrderId) async {
    trainOrderId = ticketOrderId;
    notifyListeners();
  }
  Future<void> setTrainSeat(String? seat) async {
    trainSeat = seat;
    notifyListeners();
  }
  Future<void> setEmailOrder(String? email) async {
    emailOrder = email;
    notifyListeners();
  }
  Future<void> setNameOrder(String? nameO) async {
    nameOrder = nameO;
    notifyListeners();
  }
  Future<void> setTotalAmount(String? total) async {
    totalAmount = total;
    notifyListeners();
  }
  Future<void> setClassTrain(String? classT) async {
    classTrain = classT;
    notifyListeners();
  }
  Future<void> setTicketOrderCode(String? ticket) async {
    ticketOrderCode = ticket;
    notifyListeners();
  }
  Future<void> setStationOrigin(String? stationO) async {
    stationOrigin = stationO;
    notifyListeners();
  }
  Future<void> setStationDestination(String? stationD) async {
    stationDestination = stationD;
    notifyListeners();
  }
  Future<void> setDepatureTime(String? depature) async {
    depatureTime = depature;
    notifyListeners();
  }
  Future<void> setArriveTime(String? arrive) async {
    arriveTime = arrive;
    notifyListeners();
  }
  Future<void> setDateTime(String? date) async {
    dateTime = date;
    notifyListeners();
  }
  Future<void> setTypePayment(String? type) async {
    typePayment = type;
    notifyListeners();
  }
  Future<void> setNamePayment(String? nameP) async {
    namePayment = nameP;
    notifyListeners();
  }
  Future<void> setImagePayment(String? image) async {
    imagePayment = image;
    notifyListeners();
  }
  Future<void> setTrainPrice(int? price) async {
    trainPrice = price;
    notifyListeners();
  }
  Future<void> setCreatedAt(String? created) async {
    createdAt = created;
    notifyListeners();
  }
  Future<void> setUpdatedAt(String? updated) async {
    updatedAt = updated;
    notifyListeners();
  }
  Future<void> setAccountName(String? accountNa) async {
    accountName = accountNa;
    notifyListeners();
  }
  Future<void> setAccountNumber(String? accountNu) async {
    accountNumber = accountNu;
    notifyListeners();
  }
  Future<void> setQuantityAdult(int? qualityA) async {
    quantityAdult = qualityA;
    notifyListeners();
  }
  Future<void> setQuantityInfant(String? qualityI) async {
    quantityInfant = qualityI;
    notifyListeners();
  }


  // DataOrderDetail? dataOrderDetail;

  // int? _ticketOrderId;
  // int? get ticketOrderId => _ticketOrderId;

  // int? _trainId;
  // int? get trainId => _trainId;

  // void setTicketOrderAndTrainId(int ticketOrderId, int trainId) {
  //   _ticketOrderId = ticketOrderId;
  //   _trainId = trainId;
  // }

  // Future<void> fetchTrainOrderDetail({
  //   required int ticketOrderId,
  //   required int trainId,
  // }) async {
  //   try {
  //     final response = await TrainOrderDetailApi()
  //         .fetchOrderTrainTicketDetail(ticketOrderId, trainId);
  //     print('Trai Order Id ${response.data}');
  //     dataOrderDetail = DataOrderDetail.fromJson(response.data);
  //     notifyListeners();
  //   } catch (error) {
  //     print(error);
  //   }
  // }
  TrainOrderDetailProvider({
    this.nameTrain,
    this.classTrain,
    this.ticketOrderCode,
    this.stationOrigin,
    this.stationDestination,
    this.depatureTime,
    this.arriveTime,
    this.dateTime,
    this.typePayment,
    this.namePayment,
    this.imagePayment,
    this.trainPrice,
    this.createdAt,
    this.updatedAt,
    this.accountName,
    this.accountNumber,
    this.quantityAdult,
    this.quantityInfant,
    this.totalAmount,
    this.nameOrder,
    this.emailOrder,
    this.idNumber,
    this.trainCarriage,
    this.trainSeat,
    this.trainOrderId,
  });
}
