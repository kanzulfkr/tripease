// To parse this JSON data, do
//
//     final hotelOrderModel = hotelOrderModelFromJson(jsonString);

import 'dart:convert';

HotelOrderModel hotelOrderModelFromJson(String str) =>
    HotelOrderModel.fromJson(json.decode(str));

String hotelOrderModelToJson(HotelOrderModel data) =>
    json.encode(data.toJson());

class HotelOrderModel {
  int? statusCode;
  String? message;
  List<Datum>? data;
  Meta? meta;

  HotelOrderModel({
    this.statusCode,
    this.message,
    this.data,
    this.meta,
  });

  factory HotelOrderModel.fromJson(Map<String, dynamic> json) =>
      HotelOrderModel(
        statusCode: json["status_code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class Datum {
  int? hotelOrderId;
  int? quantityAdult;
  int? quantityInfant;
  int? numberOfNight;
  DateTime? checkInDate;
  DateTime? checkOutDate;
  int? price;
  int? totalAmount;
  String? nameOrder;
  String? emailOrder;
  String? phoneNumberOrder;
  String? specialRequest;
  String? ticketOrderCode;
  bool? isCheckIn;
  bool? isCheckOut;
  String? status;
  Hotel? hotel;
  Payment? payment;
  List<TravelerDetail>? travelerDetail;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.hotelOrderId,
    this.quantityAdult,
    this.quantityInfant,
    this.numberOfNight,
    this.checkInDate,
    this.checkOutDate,
    this.price,
    this.totalAmount,
    this.nameOrder,
    this.emailOrder,
    this.phoneNumberOrder,
    this.specialRequest,
    this.ticketOrderCode,
    this.isCheckIn,
    this.isCheckOut,
    this.status,
    this.hotel,
    this.payment,
    this.travelerDetail,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        hotelOrderId: json["hotel_order_id"],
        quantityAdult: json["quantity_adult"],
        quantityInfant: json["quantity_infant"],
        numberOfNight: json["number_of_night"],
        checkInDate: json["check_in_date"] == null
            ? null
            : DateTime.parse(json["check_in_date"]),
        checkOutDate: json["check_out_date"] == null
            ? null
            : DateTime.parse(json["check_out_date"]),
        price: json["price"],
        totalAmount: json["total_amount"],
        nameOrder: json["name_order"],
        emailOrder: json["email_order"],
        phoneNumberOrder: json["phone_number_order"],
        specialRequest: json["special_request"],
        ticketOrderCode: json["ticket_order_code"],
        isCheckIn: json["is_check_in"],
        isCheckOut: json["is_check_out"],
        status: json["status"],
        hotel: json["hotel"] == null ? null : Hotel.fromJson(json["hotel"]),
        payment:
            json["payment"] == null ? null : Payment.fromJson(json["payment"]),
        travelerDetail: json["traveler_detail"] == null
            ? []
            : List<TravelerDetail>.from(json["traveler_detail"]!
                .map((x) => TravelerDetail.fromJson(x))),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "hotel_order_id": hotelOrderId,
        "quantity_adult": quantityAdult,
        "quantity_infant": quantityInfant,
        "number_of_night": numberOfNight,
        "check_in_date":
            "${checkInDate!.year.toString().padLeft(4, '0')}-${checkInDate!.month.toString().padLeft(2, '0')}-${checkInDate!.day.toString().padLeft(2, '0')}",
        "check_out_date":
            "${checkOutDate!.year.toString().padLeft(4, '0')}-${checkOutDate!.month.toString().padLeft(2, '0')}-${checkOutDate!.day.toString().padLeft(2, '0')}",
        "price": price,
        "total_amount": totalAmount,
        "name_order": nameOrder,
        "email_order": emailOrder,
        "phone_number_order": phoneNumberOrder,
        "special_request": specialRequest,
        "ticket_order_code": ticketOrderCode,
        "is_check_in": isCheckIn,
        "is_check_out": isCheckOut,
        "status": status,
        "hotel": hotel?.toJson(),
        "payment": payment?.toJson(),
        "traveler_detail": travelerDetail == null
            ? []
            : List<dynamic>.from(travelerDetail!.map((x) => x.toJson())),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Hotel {
  int? hotelId;
  String? name;
  int? hotelClass;
  String? description;
  String? phoneNumber;
  String? email;
  String? address;
  List<HotelImage>? hotelImage;
  List<HotelFacility>? hotelFacilities;
  HotelPolicy? hotelPolicy;
  HotelRoom? hotelRoom;

  Hotel({
    this.hotelId,
    this.name,
    this.hotelClass,
    this.description,
    this.phoneNumber,
    this.email,
    this.address,
    this.hotelImage,
    this.hotelFacilities,
    this.hotelPolicy,
    this.hotelRoom,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        hotelId: json["hotel_id"],
        name: json["name"],
        hotelClass: json["class"],
        description: json["description"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        address: json["address"],
        hotelImage: json["hotel_image"] == null
            ? []
            : List<HotelImage>.from(
                json["hotel_image"]!.map((x) => HotelImage.fromJson(x))),
        hotelFacilities: json["hotel_facilities"] == null
            ? []
            : List<HotelFacility>.from(json["hotel_facilities"]!
                .map((x) => HotelFacility.fromJson(x))),
        hotelPolicy: json["hotel_policy"] == null
            ? null
            : HotelPolicy.fromJson(json["hotel_policy"]),
        hotelRoom: json["hotel_room"] == null
            ? null
            : HotelRoom.fromJson(json["hotel_room"]),
      );

  Map<String, dynamic> toJson() => {
        "hotel_id": hotelId,
        "name": name,
        "class": hotelClass,
        "description": description,
        "phone_number": phoneNumber,
        "email": email,
        "address": address,
        "hotel_image": hotelImage == null
            ? []
            : List<dynamic>.from(hotelImage!.map((x) => x.toJson())),
        "hotel_facilities": hotelFacilities == null
            ? []
            : List<dynamic>.from(hotelFacilities!.map((x) => x.toJson())),
        "hotel_policy": hotelPolicy?.toJson(),
        "hotel_room": hotelRoom?.toJson(),
      };
}

class HotelFacility {
  int? hotelId;
  String? name;

  HotelFacility({
    this.hotelId,
    this.name,
  });

  factory HotelFacility.fromJson(Map<String, dynamic> json) => HotelFacility(
        hotelId: json["hotel_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "hotel_id": hotelId,
        "name": name,
      };
}

class HotelImage {
  int? hotelId;
  String? imageUrl;

  HotelImage({
    this.hotelId,
    this.imageUrl,
  });

  factory HotelImage.fromJson(Map<String, dynamic> json) => HotelImage(
        hotelId: json["hotel_id"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "hotel_id": hotelId,
        "image_url": imageUrl,
      };
}

class HotelPolicy {
  int? hotelId;
  bool? isCheckInCheckOut;
  String? timeCheckIn;
  String? timeCheckOut;
  bool? isPolicyCanceled;
  int? policyMinimumAge;
  bool? isPolicyMinimumAge;
  bool? isCheckInEarly;
  bool? isCheckOutOverdue;
  bool? isBreakfast;
  String? timeBreakfastStart;
  String? timeBreakfastEnd;
  bool? isSmoking;
  bool? isPet;

  HotelPolicy({
    this.hotelId,
    this.isCheckInCheckOut,
    this.timeCheckIn,
    this.timeCheckOut,
    this.isPolicyCanceled,
    this.policyMinimumAge,
    this.isPolicyMinimumAge,
    this.isCheckInEarly,
    this.isCheckOutOverdue,
    this.isBreakfast,
    this.timeBreakfastStart,
    this.timeBreakfastEnd,
    this.isSmoking,
    this.isPet,
  });

  factory HotelPolicy.fromJson(Map<String, dynamic> json) => HotelPolicy(
        hotelId: json["hotel_id"],
        isCheckInCheckOut: json["is_check_in_check_out"],
        timeCheckIn: json["time_check_in"],
        timeCheckOut: json["time_check_out"],
        isPolicyCanceled: json["is_policy_canceled"],
        policyMinimumAge: json["policy_minimum_age"],
        isPolicyMinimumAge: json["is_policy_minimum_age"],
        isCheckInEarly: json["is_check_in_early"],
        isCheckOutOverdue: json["is_check_out_overdue"],
        isBreakfast: json["is_breakfast"],
        timeBreakfastStart: json["time_breakfast_start"],
        timeBreakfastEnd: json["time_breakfast_end"],
        isSmoking: json["is_smoking"],
        isPet: json["is_pet"],
      );

  Map<String, dynamic> toJson() => {
        "hotel_id": hotelId,
        "is_check_in_check_out": isCheckInCheckOut,
        "time_check_in": timeCheckIn,
        "time_check_out": timeCheckOut,
        "is_policy_canceled": isPolicyCanceled,
        "policy_minimum_age": policyMinimumAge,
        "is_policy_minimum_age": isPolicyMinimumAge,
        "is_check_in_early": isCheckInEarly,
        "is_check_out_overdue": isCheckOutOverdue,
        "is_breakfast": isBreakfast,
        "time_breakfast_start": timeBreakfastStart,
        "time_breakfast_end": timeBreakfastEnd,
        "is_smoking": isSmoking,
        "is_pet": isPet,
      };
}

class HotelRoom {
  int? hotelRoomId;
  int? hotelId;
  String? name;
  int? sizeOfRoom;
  int? quantityOfRoom;
  String? description;
  int? normalPrice;
  int? discount;
  int? discountPrice;
  int? numberOfGuest;
  String? mattressSize;
  int? numberOfMattress;
  List<HotelRoomImage>? hotelRoomImage;
  List<HotelRoomFacility>? hotelRoomFacility;

  HotelRoom({
    this.hotelRoomId,
    this.hotelId,
    this.name,
    this.sizeOfRoom,
    this.quantityOfRoom,
    this.description,
    this.normalPrice,
    this.discount,
    this.discountPrice,
    this.numberOfGuest,
    this.mattressSize,
    this.numberOfMattress,
    this.hotelRoomImage,
    this.hotelRoomFacility,
  });

  factory HotelRoom.fromJson(Map<String, dynamic> json) => HotelRoom(
        hotelRoomId: json["hotel_room_id"],
        hotelId: json["hotel_id"],
        name: json["name"],
        sizeOfRoom: json["size_of_room"],
        quantityOfRoom: json["quantity_of_room"],
        description: json["description"],
        normalPrice: json["normal_price"],
        discount: json["discount"],
        discountPrice: json["discount_price"],
        numberOfGuest: json["number_of_guest"],
        mattressSize: json["mattress_size"],
        numberOfMattress: json["number_of_mattress"],
        hotelRoomImage: json["hotel_room_image"] == null
            ? []
            : List<HotelRoomImage>.from(json["hotel_room_image"]!
                .map((x) => HotelRoomImage.fromJson(x))),
        hotelRoomFacility: json["hotel_room_facility"] == null
            ? []
            : List<HotelRoomFacility>.from(json["hotel_room_facility"]!
                .map((x) => HotelRoomFacility.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hotel_room_id": hotelRoomId,
        "hotel_id": hotelId,
        "name": name,
        "size_of_room": sizeOfRoom,
        "quantity_of_room": quantityOfRoom,
        "description": description,
        "normal_price": normalPrice,
        "discount": discount,
        "discount_price": discountPrice,
        "number_of_guest": numberOfGuest,
        "mattress_size": mattressSize,
        "number_of_mattress": numberOfMattress,
        "hotel_room_image": hotelRoomImage == null
            ? []
            : List<dynamic>.from(hotelRoomImage!.map((x) => x.toJson())),
        "hotel_room_facility": hotelRoomFacility == null
            ? []
            : List<dynamic>.from(hotelRoomFacility!.map((x) => x.toJson())),
      };
}

class HotelRoomFacility {
  int? hotelId;
  int? hotelRoomId;
  String? name;

  HotelRoomFacility({
    this.hotelId,
    this.hotelRoomId,
    this.name,
  });

  factory HotelRoomFacility.fromJson(Map<String, dynamic> json) =>
      HotelRoomFacility(
        hotelId: json["hotel_id"],
        hotelRoomId: json["hotel_room_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "hotel_id": hotelId,
        "hotel_room_id": hotelRoomId,
        "name": name,
      };
}

class HotelRoomImage {
  int? hotelId;
  int? hotelRoomId;
  String? imageUrl;

  HotelRoomImage({
    this.hotelId,
    this.hotelRoomId,
    this.imageUrl,
  });

  factory HotelRoomImage.fromJson(Map<String, dynamic> json) => HotelRoomImage(
        hotelId: json["hotel_id"],
        hotelRoomId: json["hotel_room_id"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "hotel_id": hotelId,
        "hotel_room_id": hotelRoomId,
        "image_url": imageUrl,
      };
}

class Payment {
  int? paymentId;
  String? type;
  String? imageUrl;
  String? name;
  String? accountName;
  String? accountNumber;

  Payment({
    this.paymentId,
    this.type,
    this.imageUrl,
    this.name,
    this.accountName,
    this.accountNumber,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        paymentId: json["payment_id"],
        type: json["type"],
        imageUrl: json["image_url"],
        name: json["name"],
        accountName: json["account_name"],
        accountNumber: json["account_number"],
      );

  Map<String, dynamic> toJson() => {
        "payment_id": paymentId,
        "type": type,
        "image_url": imageUrl,
        "name": name,
        "account_name": accountName,
        "account_number": accountNumber,
      };
}

class TravelerDetail {
  int? travelerDetailId;
  String? title;
  String? fullName;
  String? idCardNumber;

  TravelerDetail({
    this.travelerDetailId,
    this.title,
    this.fullName,
    this.idCardNumber,
  });

  factory TravelerDetail.fromJson(Map<String, dynamic> json) => TravelerDetail(
        travelerDetailId: json["traveler_detail_id"],
        title: json["title"],
        fullName: json["full_name"],
        idCardNumber: json["id_card_number"],
      );

  Map<String, dynamic> toJson() => {
        "traveler_detail_id": travelerDetailId,
        "title": title,
        "full_name": fullName,
        "id_card_number": idCardNumber,
      };
}

class Meta {
  int? currentPage;
  int? prevPage;
  dynamic nextPage;
  int? total;

  Meta({
    this.currentPage,
    this.prevPage,
    this.nextPage,
    this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        prevPage: json["prev_page"],
        nextPage: json["next_page"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "prev_page": prevPage,
        "next_page": nextPage,
        "total": total,
      };
}
