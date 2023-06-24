// To parse this JSON data, do
//
//     final historySearchStation = historySearchStationFromJson(jsonString);

import 'dart:convert';

HistorySearchStation historySearchStationFromJson(String str) =>
    HistorySearchStation.fromJson(json.decode(str));

String historySearchStationToJson(HistorySearchStation data) =>
    json.encode(data.toJson());

class HistorySearchStation {
  int? statusCode;
  String? message;
  List<Datum>? data;
  Meta? meta;

  HistorySearchStation({
    this.statusCode,
    this.message,
    this.data,
    this.meta,
  });

  factory HistorySearchStation.fromJson(Map<String, dynamic> json) =>
      HistorySearchStation(
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
  int? id;
  Station? stationOrigin;
  Station? stationDestination;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.stationOrigin,
    this.stationDestination,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        stationOrigin: json["station_origin"] == null
            ? null
            : Station.fromJson(json["station_origin"]),
        stationDestination: json["station_destination"] == null
            ? null
            : Station.fromJson(json["station_destination"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "station_origin": stationOrigin?.toJson(),
        "station_destination": stationDestination?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Station {
  int? stationId;
  String? origin;
  String? name;
  String? initial;

  Station({
    this.stationId,
    this.origin,
    this.name,
    this.initial,
  });

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        stationId: json["station_id"],
        origin: json["origin"],
        name: json["name"],
        initial: json["initial"],
      );

  Map<String, dynamic> toJson() => {
        "station_id": stationId,
        "origin": origin,
        "name": name,
        "initial": initial,
      };
}

class Meta {
  int? currentPage;
  int? prevPage;
  int? nextPage;
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
