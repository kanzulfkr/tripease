import 'dart:convert';

StationResponseModel stationResponseModelFromJson(String str) =>
    StationResponseModel.fromJson(json.decode(str));

String stationResponseModelToJson(StationResponseModel data) =>
    json.encode(data.toJson());

class StationResponseModel {
  List<Datum>? data;

  StationResponseModel({
    this.data,
  });

  factory StationResponseModel.fromJson(Map<String, dynamic> json) =>
      StationResponseModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? stationId;
  String? origin;
  String? name;
  String? initial;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.stationId,
    this.origin,
    this.name,
    this.initial,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        stationId: json["station_id"],
        origin: json["origin"],
        name: json["name"],
        initial: json["initial"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "station_id": stationId,
        "origin": origin,
        "name": name,
        "initial": initial,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
