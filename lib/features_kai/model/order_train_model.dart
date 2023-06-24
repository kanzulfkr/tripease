// To parse this JSON data, do
//
//     final postOrderTrainModel = postOrderTrainModelFromJson(jsonString);

import 'dart:convert';

PostOrderTrainModel postOrderTrainModelFromJson(String str) =>
    PostOrderTrainModel.fromJson(json.decode(str));

String postOrderTrainModelToJson(PostOrderTrainModel data) =>
    json.encode(data.toJson());

class PostOrderTrainModel {
  String? emailOrder;
  String? nameOrder;
  int? paymentId;
  String? phoneNumberOrder;
  int? quantityAdult;
  int? quantityInfant;
  List<TicketTravelerDetail>? ticketTravelerDetailDeparture;
  List<TicketTravelerDetail>? ticketTravelerDetailReturn;
  List<TravelerDetail>? travelerDetail;
  bool? withReturn;

  PostOrderTrainModel({
    this.emailOrder,
    this.nameOrder,
    this.paymentId,
    this.phoneNumberOrder,
    this.quantityAdult,
    this.quantityInfant,
    this.ticketTravelerDetailDeparture,
    this.ticketTravelerDetailReturn,
    this.travelerDetail,
    this.withReturn,
  });

  factory PostOrderTrainModel.fromJson(Map<String, dynamic> json) =>
      PostOrderTrainModel(
        emailOrder: json["email_order"],
        nameOrder: json["name_order"],
        paymentId: json["payment_id"],
        phoneNumberOrder: json["phone_number_order"],
        quantityAdult: json["quantity_adult"],
        quantityInfant: json["quantity_infant"],
        ticketTravelerDetailDeparture:
            json["ticket_traveler_detail_departure"] == null
                ? []
                : List<TicketTravelerDetail>.from(
                    json["ticket_traveler_detail_departure"]!
                        .map((x) => TicketTravelerDetail.fromJson(x))),
        ticketTravelerDetailReturn:
            json["ticket_traveler_detail_return"] == null
                ? []
                : List<TicketTravelerDetail>.from(
                    json["ticket_traveler_detail_return"]!
                        .map((x) => TicketTravelerDetail.fromJson(x))),
        travelerDetail: json["traveler_detail"] == null
            ? []
            : List<TravelerDetail>.from(json["traveler_detail"]!
                .map((x) => TravelerDetail.fromJson(x))),
        withReturn: json["with_return"],
      );

  Map<String, dynamic> toJson() => {
        "email_order": emailOrder,
        "name_order": nameOrder,
        "payment_id": paymentId,
        "phone_number_order": phoneNumberOrder,
        "quantity_adult": quantityAdult,
        "quantity_infant": quantityInfant,
        "ticket_traveler_detail_departure":
            ticketTravelerDetailDeparture == null
                ? []
                : List<dynamic>.from(
                    ticketTravelerDetailDeparture!.map((x) => x.toJson())),
        "ticket_traveler_detail_return": ticketTravelerDetailReturn == null
            ? []
            : List<dynamic>.from(
                ticketTravelerDetailReturn!.map((x) => x.toJson())),
        "traveler_detail": travelerDetail == null
            ? []
            : List<dynamic>.from(travelerDetail!.map((x) => x.toJson())),
        "with_return": withReturn,
      };
}

class TicketTravelerDetail {
  DateTime? date;
  int? stationDestinationId;
  int? stationOriginId;
  int? trainCarriageId;
  int? trainSeatId;

  TicketTravelerDetail({
    this.date,
    this.stationDestinationId,
    this.stationOriginId,
    this.trainCarriageId,
    this.trainSeatId,
  });

  factory TicketTravelerDetail.fromJson(Map<String, dynamic> json) =>
      TicketTravelerDetail(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        stationDestinationId: json["station_destination_id"],
        stationOriginId: json["station_origin_id"],
        trainCarriageId: json["train_carriage_id"],
        trainSeatId: json["train_seat_id"],
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "station_destination_id": stationDestinationId,
        "station_origin_id": stationOriginId,
        "train_carriage_id": trainCarriageId,
        "train_seat_id": trainSeatId,
      };
}

class TravelerDetail {
  String? fullName;
  String? idCardNumber;
  String? title;

  TravelerDetail({
    this.fullName,
    this.idCardNumber,
    this.title,
  });

  factory TravelerDetail.fromJson(Map<String, dynamic> json) => TravelerDetail(
        fullName: json["full_name"],
        idCardNumber: json["id_card_number"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "id_card_number": idCardNumber,
        "title": title,
      };
}
