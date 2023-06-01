import 'dart:convert';

class UserProfile {
  int? statusCode;
  String? message;
  Data data;

  UserProfile({
    this.statusCode,
    this.message,
    required this.data,
  });

  factory UserProfile.fromRawJson(String str) =>
      UserProfile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        statusCode: json["status_code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  int? id;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? gender;
  // DateTime birthDate;
  String? birthDate;
  String? profilePictureUrl;
  String? citizen;
  String? role;
  // dynamic? token;
  // DateTime? createdAt;
  // DateTime? updatedAt;

  Data({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.birthDate,
    this.profilePictureUrl,
    this.citizen,
    this.role,
    // required this.token,
    // this.createdAt,
    // this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"] ?? "",
      fullName: json["full_name"] ?? "",
      email: json["email"] ?? "",
      phoneNumber: json["phone_number"] ?? "",
      gender: json["gender"] ?? "",
      // birthDate: DateTime.parse(json["birth_date"]),
      birthDate: json["birth_date"],
      profilePictureUrl: json["profile_picture_url"],
      citizen: json["citizen"] ?? "",
      role: json["role"] ?? "",
      // // token: json["token"] ?? "",
      // createdAt: DateTime.parse(json["created_at"]),
      // updatedAt: DateTime.parse(json["updated_at"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "phone_number": phoneNumber,
        "gender": gender,
        // "birth_date":
        //     "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "birth_date": birthDate,
        "profile_picture_url": profilePictureUrl,
        "citizen": citizen,
        "role": role,
        // // "token": token,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
      };
}
