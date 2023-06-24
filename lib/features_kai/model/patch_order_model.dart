import 'dart:convert';

PatchOrderModel patchOrderModelFromJson(String str) =>
    PatchOrderModel.fromJson(json.decode(str));

String patchOrderModelToJson(PatchOrderModel data) =>
    json.encode(data.toJson());

class PatchOrderModel {
  int? statusCode;
  String? message;
  Data? data;

  PatchOrderModel({
    this.statusCode,
    this.message,
    this.data,
  });

  factory PatchOrderModel.fromJson(Map<String, dynamic> json) =>
      PatchOrderModel(
        statusCode: json["status_code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  int? ticketOrderId;
  int? quantityAdult;
  int? quantityInfant;
  int? price;
  int? totalAmount;
  String? nameOrder;
  String? emailOrder;
  String? phoneNumberOrder;
  String? ticketOrderCode;
  String? status;
  Payment? payment;
  List<TicketTravelerDetail>? ticketTravelerDetail;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.ticketOrderId,
    this.quantityAdult,
    this.quantityInfant,
    this.price,
    this.totalAmount,
    this.nameOrder,
    this.emailOrder,
    this.phoneNumberOrder,
    this.ticketOrderCode,
    this.status,
    this.payment,
    this.ticketTravelerDetail,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        ticketOrderId: json["ticket_order_id"],
        quantityAdult: json["quantity_adult"],
        quantityInfant: json["quantity_infant"],
        price: json["price"],
        totalAmount: json["total_amount"],
        nameOrder: json["name_order"],
        emailOrder: json["email_order"],
        phoneNumberOrder: json["phone_number_order"],
        ticketOrderCode: json["ticket_order_code"],
        status: json["status"],
        payment:
            json["payment"] == null ? null : Payment.fromJson(json["payment"]),
        ticketTravelerDetail: json["ticket_traveler_detail"] == null
            ? []
            : List<TicketTravelerDetail>.from(json["ticket_traveler_detail"]!
                .map((x) => TicketTravelerDetail.fromJson(x))),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "ticket_order_id": ticketOrderId,
        "quantity_adult": quantityAdult,
        "quantity_infant": quantityInfant,
        "price": price,
        "total_amount": totalAmount,
        "name_order": nameOrder,
        "email_order": emailOrder,
        "phone_number_order": phoneNumberOrder,
        "ticket_order_code": ticketOrderCode,
        "status": status,
        "payment": payment?.toJson(),
        "ticket_traveler_detail": ticketTravelerDetail == null
            ? []
            : List<dynamic>.from(ticketTravelerDetail!.map((x) => x.toJson())),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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

class TicketTravelerDetail {
  int? ticketTravelerDetailId;
  TravelerDetail? travelerDetail;
  Train? train;
  Station? stationOrigin;
  Station? stationDestination;
  DateTime? date;
  String? boardingTicketCode;

  TicketTravelerDetail({
    this.ticketTravelerDetailId,
    this.travelerDetail,
    this.train,
    this.stationOrigin,
    this.stationDestination,
    this.date,
    this.boardingTicketCode,
  });

  factory TicketTravelerDetail.fromJson(Map<String, dynamic> json) =>
      TicketTravelerDetail(
        ticketTravelerDetailId: json["ticket_traveler_detail_id"],
        travelerDetail: json["traveler_detail"] == null
            ? null
            : TravelerDetail.fromJson(json["traveler_detail"]),
        train: json["train"] == null ? null : Train.fromJson(json["train"]),
        stationOrigin: json["station_origin"] == null
            ? null
            : Station.fromJson(json["station_origin"]),
        stationDestination: json["station_destination"] == null
            ? null
            : Station.fromJson(json["station_destination"]),
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        boardingTicketCode: json["boarding_ticket_code"],
      );

  Map<String, dynamic> toJson() => {
        "ticket_traveler_detail_id": ticketTravelerDetailId,
        "traveler_detail": travelerDetail?.toJson(),
        "train": train?.toJson(),
        "station_origin": stationOrigin?.toJson(),
        "station_destination": stationDestination?.toJson(),
        "date": date?.toIso8601String(),
        "boarding_ticket_code": boardingTicketCode,
      };
}

class Station {
  int? stationId;
  String? origin;
  String? name;
  String? initial;
  String? arriveTime;

  Station({
    this.stationId,
    this.origin,
    this.name,
    this.initial,
    this.arriveTime,
  });

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        stationId: json["station_id"],
        origin: json["origin"],
        name: json["name"],
        initial: json["initial"],
        arriveTime: json["arrive_time"],
      );

  Map<String, dynamic> toJson() => {
        "station_id": stationId,
        "origin": origin,
        "name": name,
        "initial": initial,
        "arrive_time": arriveTime,
      };
}

class Train {
  int? trainId;
  String? codeTrain;
  String? name;
  String? trainClass;
  int? trainPrice;
  int? trainCarriageId;
  String? trainCarriage;
  int? trainSeatId;
  String? trainSeat;

  Train({
    this.trainId,
    this.codeTrain,
    this.name,
    this.trainClass,
    this.trainPrice,
    this.trainCarriageId,
    this.trainCarriage,
    this.trainSeatId,
    this.trainSeat,
  });

  factory Train.fromJson(Map<String, dynamic> json) => Train(
        trainId: json["train_id"],
        codeTrain: json["code_train"],
        name: json["name"],
        trainClass: json["class"],
        trainPrice: json["train_price"],
        trainCarriageId: json["train_carriage_id"],
        trainCarriage: json["train_carriage"],
        trainSeatId: json["train_seat_id"],
        trainSeat: json["train_seat"],
      );

  Map<String, dynamic> toJson() => {
        "train_id": trainId,
        "code_train": codeTrain,
        "name": name,
        "class": trainClass,
        "train_price": trainPrice,
        "train_carriage_id": trainCarriageId,
        "train_carriage": trainCarriage,
        "train_seat_id": trainSeatId,
        "train_seat": trainSeat,
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
