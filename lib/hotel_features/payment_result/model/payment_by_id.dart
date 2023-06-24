// To parse this JSON data, do
//
//     final paymentByIdHotelModel = paymentByIdHotelModelFromJson(jsonString);

import 'dart:convert';

PaymentByIdHotelModel paymentByIdHotelModelFromJson(String str) =>
    PaymentByIdHotelModel.fromJson(json.decode(str));

String paymentByIdHotelModelToJson(PaymentByIdHotelModel data) =>
    json.encode(data.toJson());

class PaymentByIdHotelModel {
  int? statusCode;
  String? message;
  Data? data;

  PaymentByIdHotelModel({
    this.statusCode,
    this.message,
    this.data,
  });

  factory PaymentByIdHotelModel.fromJson(Map<String, dynamic> json) =>
      PaymentByIdHotelModel(
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
  int? id;
  String? type;
  String? imageUrl;
  String? name;
  String? accountName;
  String? accountNumber;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.type,
    this.imageUrl,
    this.name,
    this.accountName,
    this.accountNumber,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        type: json["type"],
        imageUrl: json["image_url"],
        name: json["name"],
        accountName: json["account_name"],
        accountNumber: json["account_number"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "image_url": imageUrl,
        "name": name,
        "account_name": accountName,
        "account_number": accountNumber,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
