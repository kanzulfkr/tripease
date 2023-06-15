import 'dart:convert';

OrderTrainModel orderTrainModelFromJson(String str) =>
    OrderTrainModel.fromJson(json.decode(str));

String orderTrainModelToJson(OrderTrainModel data) =>
    json.encode(data.toJson());

class OrderTrainModel {
  int? statusCode;
  String? message;
  List<Datum>? data;
  Meta? meta;

  OrderTrainModel({
    this.statusCode,
    this.message,
    this.data,
    this.meta,
  });

  factory OrderTrainModel.fromJson(Map<String, dynamic> json) =>
      OrderTrainModel(
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
  int? ticketOrderId;
  int? quantityAdult;
  int? quantityInfant;
  String? nameOrder;
  String? emailOrder;
  String? phoneNumberOrder;
  String? ticketOrderCode;
  Payment? payment;
  List<TravelerDetail>? travelerDetail;
  Train? train;
  Station? stationOrigin;
  Station? stationDestination;
  DateTime? date;
  String? boardingTicketCode;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.ticketOrderId,
    this.quantityAdult,
    this.quantityInfant,
    this.nameOrder,
    this.emailOrder,
    this.phoneNumberOrder,
    this.ticketOrderCode,
    this.payment,
    this.travelerDetail,
    this.train,
    this.stationOrigin,
    this.stationDestination,
    this.date,
    this.boardingTicketCode,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        ticketOrderId: json["ticket_order_id"],
        quantityAdult: json["quantity_adult"],
        quantityInfant: json["quantity_infant"],
        nameOrder: json["name_order"],
        emailOrder: json["email_order"],
        phoneNumberOrder: json["phone_number_order"],
        ticketOrderCode: json["ticket_order_code"],
        payment:
            json["payment"] == null ? null : Payment.fromJson(json["payment"]),
        travelerDetail: json["traveler_detail"] == null
            ? []
            : List<TravelerDetail>.from(json["traveler_detail"]!
                .map((x) => TravelerDetail.fromJson(x))),
        train: json["train"] == null ? null : Train.fromJson(json["train"]),
        stationOrigin: json["station_origin"] == null
            ? null
            : Station.fromJson(json["station_origin"]),
        stationDestination: json["station_destination"] == null
            ? null
            : Station.fromJson(json["station_destination"]),
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        boardingTicketCode: json["boarding_ticket_code"],
        status: json["status"],
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
        "name_order": nameOrder,
        "email_order": emailOrder,
        "phone_number_order": phoneNumberOrder,
        "ticket_order_code": ticketOrderCode,
        "payment": payment?.toJson(),
        "traveler_detail": travelerDetail == null
            ? []
            : List<dynamic>.from(travelerDetail!.map((x) => x.toJson())),
        "train": train?.toJson(),
        "station_origin": stationOrigin?.toJson(),
        "station_destination": stationDestination?.toJson(),
        "date": date?.toIso8601String(),
        "boarding_ticket_code": boardingTicketCode,
        "status": status,
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
