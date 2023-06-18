class DepartureResponseModel {
  int statusCode;
  String message;
  List<Datum> data;
  Meta meta;

  DepartureResponseModel({
    required this.statusCode,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory DepartureResponseModel.fromJson(Map<String, dynamic> json) {
    return DepartureResponseModel(
      statusCode: json["status_code"],
      message: json["message"],
      data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      meta: Meta.fromJson(json["meta"]),
    );
  }
}

class Datum {
  int trainId;
  String codeTrain;
  String name;
  String datumClass;
  int price;
  List<Route> route;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.trainId,
    required this.codeTrain,
    required this.name,
    required this.datumClass,
    required this.price,
    required this.route,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      trainId: json["train_id"],
      codeTrain: json["code_train"],
      name: json["name"],
      datumClass: json["class"],
      price: json["price"],
      route: List<Route>.from(json["route"].map((x) => Route.fromJson(x))),
      status: json["status"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
    );
  }
}

class Route {
  int stationId;
  Station station;
  String arriveTime;

  Route({
    required this.stationId,
    required this.station,
    required this.arriveTime,
  });

  factory Route.fromJson(Map<String, dynamic> json) {
    return Route(
      stationId: json["station_id"],
      station: Station.fromJson(json["station"]),
      arriveTime: json["arrive_time"],
    );
  }
}

class Station {
  String origin;
  String name;
  String initial;

  Station({
    required this.origin,
    required this.name,
    required this.initial,
  });

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      origin: json["origin"],
      name: json["name"],
      initial: json["initial"],
    );
  }
}

class Meta {
  int currentPage;
  int? prevPage;
  int? nextPage;
  int total;

  Meta({
    required this.currentPage,
    this.prevPage,
    this.nextPage,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      currentPage: json["current_page"],
      prevPage: json["prev_page"],
      nextPage: json["next_page"],
      total: json["total"],
    );
  }
}
