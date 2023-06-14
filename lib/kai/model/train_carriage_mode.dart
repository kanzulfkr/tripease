import 'dart:convert';

CarriageModel carriageModelFromJson(String str) =>
    CarriageModel.fromJson(json.decode(str));

String carriageModelToJson(CarriageModel data) => json.encode(data.toJson());

class CarriageModel {
  int? statusCode;
  String? message;
  List<Datum>? data;
  Meta? meta;

  CarriageModel({
    this.statusCode,
    this.message,
    this.data,
    this.meta,
  });

  factory CarriageModel.fromJson(Map<String, dynamic> json) => CarriageModel(
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
  int? trainCarriageId;
  Train? train;
  String? name;
  List<Seat>? seat;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.trainCarriageId,
    this.train,
    this.name,
    this.seat,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        trainCarriageId: json["train_carriage_id"],
        train: json["train"] == null ? null : Train.fromJson(json["train"]),
        name: json["name"],
        seat: json["seat"] == null
            ? []
            : List<Seat>.from(json["seat"]!.map((x) => Seat.fromJson(x))),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "train_carriage_id": trainCarriageId,
        "train": train?.toJson(),
        "name": name,
        "seat": seat == null
            ? []
            : List<dynamic>.from(seat!.map((x) => x.toJson())),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Seat {
  int? id;
  String? name;
  bool? available;

  Seat({
    this.id,
    this.name,
    this.available,
  });

  factory Seat.fromJson(Map<String, dynamic> json) => Seat(
        id: json["id"],
        name: json["name"],
        available: json["available"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "available": available,
      };
}

class Train {
  int? trainId;
  String? codeTrain;
  String? name;
  String? trainClass;
  int? price;
  List<Route>? route;
  String? status;

  Train({
    this.trainId,
    this.codeTrain,
    this.name,
    this.trainClass,
    this.price,
    this.route,
    this.status,
  });

  factory Train.fromJson(Map<String, dynamic> json) => Train(
        trainId: json["train_id"],
        codeTrain: json["code_train"],
        name: json["name"],
        trainClass: json["class"],
        price: json["price"],
        route: json["route"] == null
            ? []
            : List<Route>.from(json["route"]!.map((x) => Route.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "train_id": trainId,
        "code_train": codeTrain,
        "name": name,
        "class": trainClass,
        "price": price,
        "route": route == null
            ? []
            : List<dynamic>.from(route!.map((x) => x.toJson())),
        "status": status,
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
