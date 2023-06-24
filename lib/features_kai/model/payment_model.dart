// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

class PaymentResponseModel {
  int statusCode;
  String message;
  List<Datum> data;
  Meta meta;

  PaymentResponseModel({
    required this.statusCode,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory PaymentResponseModel.fromRawJson(String str) =>
      PaymentResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      PaymentResponseModel(
        statusCode: json["status_code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Datum {
  int id;
  String type;
  String imageUrl;
  String name;
  String accountName;
  String accountNumber;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.type,
    required this.imageUrl,
    required this.name,
    required this.accountName,
    required this.accountNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        type: json["type"],
        imageUrl: json["image_url"],
        name: json["name"],
        accountName: json["account_name"],
        accountNumber: json["account_number"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "image_url": imageUrl,
        "name": name,
        "account_name": accountName,
        "account_number": accountNumber,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Meta {
  int currentPage;
  int prevPage;
  dynamic nextPage;
  int total;

  Meta({
    required this.currentPage,
    required this.prevPage,
    this.nextPage,
    required this.total,
  });

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
