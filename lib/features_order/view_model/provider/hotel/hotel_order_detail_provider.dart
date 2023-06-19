import 'package:flutter/material.dart';

class HotelOrderDetailProvider with ChangeNotifier {
  String? nameHotel;
  String? addressHotel;
  String? classHotel;
  String? numberOfNight;
  String? checkIn;
  String? checkOut;
  String? typePayment;
  String? accountNumber;
  String? accountName;
  String? imagePayment;
  String? ticketOrderCode;
  String? nameOrder;
  String? nameRoomHotel;
  String? emailOrder;
  String? specialRequest;
  String? hotelFacilities;
  String? numberOfGuest;
  String? quantityOfRoom;
  String? priceHotel;
  String? totalAmount;
  String? discountPrice;
  String? createAt;
  String? updateAt;

  String? get  getNameHotel => nameHotel;
  String? get  getAddressHotel => addressHotel;
  String? get  getClassHotel => classHotel;
  String? get  getNumberOfNight => numberOfNight;
  String? get  getCheckIn => checkIn;
  String? get  getCheckOut => checkOut;
  String? get  getTypePayment => typePayment;
  String? get  getAccountNumber => accountName;
  String? get  getAccountName => accountName;
  String? get  getImagePayment => imagePayment;
  String? get  getTicketOrderCode => ticketOrderCode;
  String? get  getNameOrder => nameOrder;
  String? get  getNameRoomHotel => nameRoomHotel;
  String? get  getEmailOrder => emailOrder;
  String? get  getSpecialRequest => specialRequest;
  String? get  getHotelFacilities => hotelFacilities;
  String? get  getNumberOfGuest => numberOfGuest;
  String? get  getQuantityOfRoom => quantityOfRoom;
  String? get  getPriceHotel => priceHotel;
  String? get  getTotalAmount => totalAmount;
  String? get  getDiscountPrice => discountPrice;
  String? get  getCreateAt => createAt;
  String? get  getUpdateAt => updateAt;

  Future<void> setNameHotel(String? nameH) async {
    nameHotel = nameH;
    notifyListeners();
  }
  Future<void> setAddressHotel(String? address) async {
    addressHotel = address;
    notifyListeners();
  }
  Future<void> setClassHotel(String? classH) async {
    classHotel = classH;
    notifyListeners();
  }
  Future<void> setNumberOfNight(String? numberNight) async {
    numberOfNight = numberNight;
    notifyListeners();
  }
  Future<void> setCheckIn(String? checkInHotel) async {
    checkIn = checkInHotel;
    notifyListeners();
  }
  Future<void> setCheckOut(String? checkOutHotel) async {
    checkOut = checkOutHotel;
    notifyListeners();
  }
  Future<void> setTypePayment(String? typeP) async {
    typePayment = typeP;
    notifyListeners();
  }
  Future<void> setAccountNumber(String? accountNum) async {
    accountNumber = accountNum;
    notifyListeners();
  }
  Future<void> setAccountName(String? accountN) async {
    accountName = accountN;
    notifyListeners();
  }
  Future<void> setImagePayment(String? imageP) async {
    imagePayment = imageP;
    notifyListeners();
  }
  Future<void> setTicketOrderCode(String? ticketOrder) async {
    ticketOrderCode = ticketOrder;
    notifyListeners();
  }
  Future<void> setNameOrder(String? nameO) async {
    nameOrder = nameO;
    notifyListeners();
  }
  Future<void> setNameRoomHotel(String? nameRoomH) async {
    nameRoomHotel = nameRoomH;
    notifyListeners();
  }
  Future<void> setEmailOrder(String? emailO) async {
    emailOrder = emailO;
    notifyListeners();
  }
  Future<void> setSpecialRequest(String? specialR) async {
    specialRequest = specialR;
    notifyListeners();
  }
  Future<void> setHotelFacilities(String? HotelF) async {
    hotelFacilities = HotelF;
    notifyListeners();
  }
  Future<void> setNumberOfGuest(String? numberGuest) async {
    numberOfGuest = numberGuest;
    notifyListeners();
  }
  Future<void> setQuantityRoom(String? quantityR) async {
    quantityOfRoom = quantityR;
    notifyListeners();
  }
  Future<void> setPriceHotel(String? priceH) async {
    priceHotel = priceH;
    notifyListeners();
  }
  Future<void> setTotalAmount(String? totalA) async {
    totalAmount = totalA;
    notifyListeners();
  }
  Future<void> setDiscountPrice(String? discountP) async {
    discountPrice = discountP;
    notifyListeners();
  }
  Future<void> setCreatedAt(String? created) async {
    createAt = created;
    notifyListeners();
  }

  Future<void> setUpdatedAt(String? updated) async {
    updateAt = updated;
    notifyListeners();
  }
}