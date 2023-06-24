import 'dart:convert';

DetailHotelModel detailHotelModelFromJson(String str) =>
    DetailHotelModel.fromJson(json.decode(str));

String detailHotelModelToJson(DetailHotelModel data) =>
    json.encode(data.toJson());

class DetailHotelModel {
  int? statusCode;
  String? message;
  Data? data;

  DetailHotelModel({
    this.statusCode,
    this.message,
    this.data,
  });

  factory DetailHotelModel.fromJson(Map<String, dynamic> json) =>
      DetailHotelModel(
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
  int? hotelId;
  String? name;
  int? dataClass;
  String? description;
  String? phoneNumber;
  String? email;
  String? address;
  List<HotelImage>? hotelImage;
  List<HotelFacility>? hotelFacilities;
  HotelPolicy? hotelPolicy;
  List<HotelRoom>? hotelRoom;
  List<HotelRating>? hotelRating;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.hotelId,
    this.name,
    this.dataClass,
    this.description,
    this.phoneNumber,
    this.email,
    this.address,
    this.hotelImage,
    this.hotelFacilities,
    this.hotelPolicy,
    this.hotelRoom,
    this.hotelRating,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        hotelId: json["hotel_id"],
        name: json["name"],
        dataClass: json["class"],
        description: json["description"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        address: json["address"],
        hotelImage: json["hotel_image"] == null
            ? []
            : List<HotelImage>.from(
                json["hotel_image"]!.map((x) => HotelImage.fromJson(x))),
        hotelFacilities: json["hotel_facilities"] == null
            ? []
            : List<HotelFacility>.from(json["hotel_facilities"]!
                .map((x) => HotelFacility.fromJson(x))),
        hotelPolicy: json["hotel_policy"] == null
            ? null
            : HotelPolicy.fromJson(json["hotel_policy"]),
        hotelRoom: json["hotel_room"] == null
            ? []
            : List<HotelRoom>.from(
                json["hotel_room"]!.map((x) => HotelRoom.fromJson(x))),
        hotelRating: json["hotel_rating"] == null
            ? []
            : List<HotelRating>.from(
                json["hotel_rating"]!.map((x) => HotelRating.fromJson(x))),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "hotel_id": hotelId,
        "name": name,
        "class": dataClass,
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
        "hotel_room": hotelRoom == null
            ? []
            : List<dynamic>.from(hotelRoom!.map((x) => x.toJson())),
        "hotel_rating": hotelRating == null
            ? []
            : List<dynamic>.from(hotelRating!.map((x) => x.toJson())),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
  String? timeBreakfastStart;
  String? timeBreakfastEnd;
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
        timeBreakfastStart: json["time_breakfast_start"],
        timeBreakfastEnd: json["time_breakfast_end"],
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
        "time_breakfast_start": timeBreakfastStart,
        "time_breakfast_end": timeBreakfastEnd,
        "is_smoking": isSmoking,
        "is_pet": isPet,
      };
}

class HotelRating {
  int? userId;
  String? username;
  String? userImage;
  int? rating;
  String? review;
  DateTime? createdAt;

  HotelRating({
    this.userId,
    this.username,
    this.userImage,
    this.rating,
    this.review,
    this.createdAt,
  });

  factory HotelRating.fromJson(Map<String, dynamic> json) => HotelRating(
        userId: json["user_id"],
        username: json["username"],
        userImage: json["user_image"],
        rating: json["rating"],
        review: json["review"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "user_image": userImage,
        "rating": rating,
        "review": review,
        "created_at": createdAt?.toIso8601String(),
      };
}

class HotelRoom {
  int? hotelRoomId;
  int? hotelId;
  String? name;
  int? sizeOfRoom;
  int? quantityOfRoom;
  String? description;
  int? normalPrice;
  int? discount;
  int? discountPrice;
  int? numberOfGuest;
  String? mattressSize;
  int? numberOfMattress;
  List<HotelRoomImage>? hotelRoomImage;
  List<HotelRoomFacility>? hotelRoomFacility;

  HotelRoom({
    this.hotelRoomId,
    this.hotelId,
    this.name,
    this.sizeOfRoom,
    this.quantityOfRoom,
    this.description,
    this.normalPrice,
    this.discount,
    this.discountPrice,
    this.numberOfGuest,
    this.mattressSize,
    this.numberOfMattress,
    this.hotelRoomImage,
    this.hotelRoomFacility,
  });

  factory HotelRoom.fromJson(Map<String, dynamic> json) => HotelRoom(
        hotelRoomId: json["hotel_room_id"],
        hotelId: json["hotel_id"],
        name: json["name"],
        sizeOfRoom: json["size_of_room"],
        quantityOfRoom: json["quantity_of_room"],
        description: json["description"],
        normalPrice: json["normal_price"],
        discount: json["discount"],
        discountPrice: json["discount_price"],
        numberOfGuest: json["number_of_guest"],
        mattressSize: json["mattress_size"],
        numberOfMattress: json["number_of_mattress"],
        hotelRoomImage: json["hotel_room_image"] == null
            ? []
            : List<HotelRoomImage>.from(json["hotel_room_image"]!
                .map((x) => HotelRoomImage.fromJson(x))),
        hotelRoomFacility: json["hotel_room_facility"] == null
            ? []
            : List<HotelRoomFacility>.from(json["hotel_room_facility"]!
                .map((x) => HotelRoomFacility.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hotel_room_id": hotelRoomId,
        "hotel_id": hotelId,
        "name": name,
        "size_of_room": sizeOfRoom,
        "quantity_of_room": quantityOfRoom,
        "description": description,
        "normal_price": normalPrice,
        "discount": discount,
        "discount_price": discountPrice,
        "number_of_guest": numberOfGuest,
        "mattress_size": mattressSize,
        "number_of_mattress": numberOfMattress,
        "hotel_room_image": hotelRoomImage == null
            ? []
            : List<dynamic>.from(hotelRoomImage!.map((x) => x.toJson())),
        "hotel_room_facility": hotelRoomFacility == null
            ? []
            : List<dynamic>.from(hotelRoomFacility!.map((x) => x.toJson())),
      };
}

class HotelRoomFacility {
  int? hotelId;
  int? hotelRoomId;
  String? name;

  HotelRoomFacility({
    this.hotelId,
    this.hotelRoomId,
    this.name,
  });

  factory HotelRoomFacility.fromJson(Map<String, dynamic> json) =>
      HotelRoomFacility(
        hotelId: json["hotel_id"],
        hotelRoomId: json["hotel_room_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "hotel_id": hotelId,
        "hotel_room_id": hotelRoomId,
        "name": name,
      };
}

class HotelRoomImage {
  int? hotelId;
  int? hotelRoomId;
  String? imageUrl;

  HotelRoomImage({
    this.hotelId,
    this.hotelRoomId,
    this.imageUrl,
  });

  factory HotelRoomImage.fromJson(Map<String, dynamic> json) => HotelRoomImage(
        hotelId: json["hotel_id"],
        hotelRoomId: json["hotel_room_id"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "hotel_id": hotelId,
        "hotel_room_id": hotelRoomId,
        "image_url": imageUrl,
      };
}
