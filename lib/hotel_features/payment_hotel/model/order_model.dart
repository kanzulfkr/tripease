// To parse this JSON data, do
//
//     final postOrderModel = postOrderModelFromJson(jsonString);

import 'dart:convert';

PostOrderModel postOrderModelFromJson(String str) =>
    PostOrderModel.fromJson(json.decode(str));

String postOrderModelToJson(PostOrderModel data) => json.encode(data.toJson());

class PostOrderModel {
  DateTime? dateEnd;
  DateTime? dateStart;
  String? emailOrder;
  int? hotelRoomId;
  String? nameOrder;
  int? paymentId;
  String? phoneNumberOrder;
  int? quantityAdult;
  int? quantityInfant;
  String? specialRequest;
  List<TravelerDetail>? travelerDetail;

  PostOrderModel({
    this.dateEnd,
    this.dateStart,
    this.emailOrder,
    this.hotelRoomId,
    this.nameOrder,
    this.paymentId,
    this.phoneNumberOrder,
    this.quantityAdult,
    this.quantityInfant,
    this.specialRequest,
    this.travelerDetail,
  });

  factory PostOrderModel.fromJson(Map<String, dynamic> json) => PostOrderModel(
        dateEnd:
            json["date_end"] == null ? null : DateTime.parse(json["date_end"]),
        dateStart: json["date_start"] == null
            ? null
            : DateTime.parse(json["date_start"]),
        emailOrder: json["email_order"],
        hotelRoomId: json["hotel_room_id"],
        nameOrder: json["name_order"],
        paymentId: json["payment_id"],
        phoneNumberOrder: json["phone_number_order"],
        quantityAdult: json["quantity_adult"],
        quantityInfant: json["quantity_infant"],
        specialRequest: json["special_request"],
        travelerDetail: json["traveler_detail"] == null
            ? []
            : List<TravelerDetail>.from(json["traveler_detail"]!
                .map((x) => TravelerDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date_end":
            "${dateEnd!.year.toString().padLeft(4, '0')}-${dateEnd!.month.toString().padLeft(2, '0')}-${dateEnd!.day.toString().padLeft(2, '0')}",
        "date_start":
            "${dateStart!.year.toString().padLeft(4, '0')}-${dateStart!.month.toString().padLeft(2, '0')}-${dateStart!.day.toString().padLeft(2, '0')}",
        "email_order": emailOrder,
        "hotel_room_id": hotelRoomId,
        "name_order": nameOrder,
        "payment_id": paymentId,
        "phone_number_order": phoneNumberOrder,
        "quantity_adult": quantityAdult,
        "quantity_infant": quantityInfant,
        "special_request": specialRequest,
        "traveler_detail": travelerDetail == null
            ? []
            : List<dynamic>.from(travelerDetail!.map((x) => x.toJson())),
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
