import 'dart:convert';

DepartureResponseModel departureResponseModelFromJson(String str) =>
    DepartureResponseModel.fromJson(json.decode(str));

String departureResponseModelToJson(DepartureResponseModel data) =>
    json.encode(data.toJson());

class DepartureResponseModel {
  int? statusCode;
  String? message;
  List<Datum>? data;
  Meta? meta;

  DepartureResponseModel({
    this.statusCode,
    this.message,
    this.data,
    this.meta,
  });

  factory DepartureResponseModel.fromJson(Map<String, dynamic> json) =>
      DepartureResponseModel(
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
  int? trainId;
  String? codeTrain;
  String? name;
  String? datumClass;
  int? price;
  List<Route>? route;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.trainId,
    this.codeTrain,
    this.name,
    this.datumClass,
    this.price,
    this.route,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        trainId: json["train_id"],
        codeTrain: json["code_train"],
        name: json["name"],
        datumClass: json["class"],
        price: json["price"],
        route: json["route"] == null
            ? []
            : List<Route>.from(json["route"]!.map((x) => Route.fromJson(x))),
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "train_id": trainId,
        "code_train": codeTrain,
        "name": name,
        "class": datumClass,
        "price": price,
        "route": route == null
            ? []
            : List<dynamic>.from(route!.map((x) => x.toJson())),
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Route {
  int? stationId;
  Station? station;
  String? arriveTime;

  Route({
    this.stationId,
    this.station,
    this.arriveTime,
  });

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        stationId: json["station_id"],
        station:
            json["station"] == null ? null : Station.fromJson(json["station"]),
        arriveTime: json["arrive_time"],
      );

  Map<String, dynamic> toJson() => {
        "station_id": stationId,
        "station": station?.toJson(),
        "arrive_time": arriveTime,
      };
}

class Station {
  String? origin;
  String? name;
  String? initial;

  Station({
    this.origin,
    this.name,
    this.initial,
  });

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        origin: json["origin"],
        name: json["name"],
        initial: json["initial"],
      );

  Map<String, dynamic> toJson() => {
        "origin": origin,
        "name": name,
        "initial": initial,
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
