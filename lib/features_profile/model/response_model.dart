import 'dart:convert';

ResponseModel errorResponseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String errorResponseModelToJson(ResponseModel data) =>
    json.encode(data.toJson());

class ResponseModel {
  int? statusCode;
  String? message;
  String? errors;

  ResponseModel({
    this.statusCode,
    this.message,
    this.errors,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        statusCode: json["status_code"],
        message: json["message"],
        errors: json["errors"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "errors": errors,
      };
}
