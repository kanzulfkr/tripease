import 'dart:convert';

DetailHotelRoomModel detailHotelRoomModelFromJson(String str) =>
    DetailHotelRoomModel.fromJson(json.decode(str));

String detailHotelRoomModelToJson(DetailHotelRoomModel data) =>
    json.encode(data.toJson());

class DetailHotelRoomModel {
  int? statusCode;
  String? message;
  Data? data;

  DetailHotelRoomModel({
    this.statusCode,
    this.message,
    this.data,
  });

  factory DetailHotelRoomModel.fromJson(Map<String, dynamic> json) =>
      DetailHotelRoomModel(
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
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
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
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
