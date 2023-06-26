// To parse this JSON data, do
//
//     final hotelSeenModel = hotelSeenModelFromJson(jsonString);

import 'dart:convert';

HotelSeenModel hotelSeenModelFromJson(String str) =>
    HotelSeenModel.fromJson(json.decode(str));

String hotelSeenModelToJson(HotelSeenModel data) => json.encode(data.toJson());

class HotelSeenModel {
  int? statusCode;
  String? message;
  List<Datum>? data;
  Meta? meta;

  HotelSeenModel({
    this.statusCode,
    this.message,
    this.data,
    this.meta,
  });

  factory HotelSeenModel.fromJson(Map<String, dynamic> json) => HotelSeenModel(
        statusCode: json["status_code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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
  Hotel? hotel;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.hotel,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        hotel: json["hotel"] == null ? null : Hotel.fromJson(json["hotel"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hotel": hotel?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Hotel {
  int? hotelId;
  String? name;
  int? hotelClass;
  String? description;
  String? phoneNumber;
  String? email;
  String? address;
  List<HotelImage>? hotelImage;
  List<HotelFacility>? hotelFacilities;
  HotelPolicy? hotelPolicy;

  Hotel({
    this.hotelId,
    this.name,
    this.hotelClass,
    this.description,
    this.phoneNumber,
    this.email,
    this.address,
    this.hotelImage,
    this.hotelFacilities,
    this.hotelPolicy,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        hotelId: json["hotel_id"],
        name: json["name"],
        hotelClass: json["class"],
        description: json["description"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        address: json["address"],
        hotelImage: json["hotel_image"] == null
            ? []
            : List<HotelImage>.from(
                json["hotel_image"].map((x) => HotelImage.fromJson(x))),
        hotelFacilities: json["hotel_facilities"] == null
            ? []
            : List<HotelFacility>.from(
                json["hotel_facilities"].map((x) => HotelFacility.fromJson(x))),
        hotelPolicy: json["hotel_policy"] == null
            ? null
            : HotelPolicy.fromJson(json["hotel_policy"]),
      );

  Map<String, dynamic> toJson() => {
        "hotel_id": hotelId,
        "name": name,
        "class": hotelClass,
        "description": description,
        "phone_number": phoneNumber,
        "email": email,
        "address": address,
        "hotel_image": hotelImage == null
            ? []
            : List<dynamic>.from(hotelImage!.map((x) => x.toJson())),
        "hotel_facilities": hotelFacilities == null
            ? []
            : List<dynamic>.from(hotelFacilities!.map((x) => x.toJson())),
        "hotel_policy": hotelPolicy?.toJson(),
      };
}

class HotelFacility {
  int? hotelId;
  String? name;

  HotelFacility({
    this.hotelId,
    this.name,
  });

  factory HotelFacility.fromJson(Map<String, dynamic> json) => HotelFacility(
        hotelId: json["hotel_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "hotel_id": hotelId,
        "name": name,
      };
}

class HotelImage {
  int? hotelId;
  String? imageUrl;

  HotelImage({
    this.hotelId,
    this.imageUrl,
  });

  factory HotelImage.fromJson(Map<String, dynamic> json) => HotelImage(
        hotelId: json["hotel_id"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "hotel_id": hotelId,
        "image_url": imageUrl,
      };
}

class HotelPolicy {
  int? hotelId;
  bool? isCheckInCheckOut;
  String? timeCheckIn;
  String? timeCheckOut;
  bool? isPolicyCanceled;
  int? policyMinimumAge;
  bool? isPolicyMinimumAge;
  bool? isCheckInEarly;
  bool? isCheckOutOverdue;
  bool? isBreakfast;
  TimeBreakfastStart? timeBreakfastStart;
  TimeBreakfastEnd? timeBreakfastEnd;
  bool? isSmoking;
  bool? isPet;

  HotelPolicy({
    this.hotelId,
    this.isCheckInCheckOut,
    this.timeCheckIn,
    this.timeCheckOut,
    this.isPolicyCanceled,
    this.policyMinimumAge,
    this.isPolicyMinimumAge,
    this.isCheckInEarly,
    this.isCheckOutOverdue,
    this.isBreakfast,
    this.timeBreakfastStart,
    this.timeBreakfastEnd,
    this.isSmoking,
    this.isPet,
  });

  factory HotelPolicy.fromJson(Map<String, dynamic> json) => HotelPolicy(
        hotelId: json["hotel_id"],
        isCheckInCheckOut: json["is_check_in_check_out"],
        timeCheckIn: json["time_check_in"],
        timeCheckOut: json["time_check_out"],
        isPolicyCanceled: json["is_policy_canceled"],
        policyMinimumAge: json["policy_minimum_age"],
        isPolicyMinimumAge: json["is_policy_minimum_age"],
        isCheckInEarly: json["is_check_in_early"],
        isCheckOutOverdue: json["is_check_out_overdue"],
        isBreakfast: json["is_breakfast"],
        timeBreakfastStart:
            timeBreakfastStartValues.map[json["time_breakfast_start"]],
        timeBreakfastEnd:
            timeBreakfastEndValues.map[json["time_breakfast_end"]],
        isSmoking: json["is_smoking"],
        isPet: json["is_pet"],
      );

  Map<String, dynamic> toJson() => {
        "hotel_id": hotelId,
        "is_check_in_check_out": isCheckInCheckOut,
        "time_check_in": timeCheckIn,
        "time_check_out": timeCheckOut,
        "is_policy_canceled": isPolicyCanceled,
        "policy_minimum_age": policyMinimumAge,
        "is_policy_minimum_age": isPolicyMinimumAge,
        "is_check_in_early": isCheckInEarly,
        "is_check_out_overdue": isCheckOutOverdue,
        "is_breakfast": isBreakfast,
        "time_breakfast_start":
            timeBreakfastStartValues.reverse[timeBreakfastStart],
        "time_breakfast_end": timeBreakfastEndValues.reverse[timeBreakfastEnd],
        "is_smoking": isSmoking,
        "is_pet": isPet,
      };
}

enum TimeBreakfastEnd { EMPTY, STRING, THE_0735 }

final timeBreakfastEndValues = EnumValues({
  "-": TimeBreakfastEnd.EMPTY,
  "string": TimeBreakfastEnd.STRING,
  "07:35": TimeBreakfastEnd.THE_0735
});

enum TimeBreakfastStart { EMPTY, STRING, THE_0431 }

final timeBreakfastStartValues = EnumValues({
  "-": TimeBreakfastStart.EMPTY,
  "string": TimeBreakfastStart.STRING,
  "04:31": TimeBreakfastStart.THE_0431
});

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
