import 'dart:convert';

class UserProfile {
  int statusCode;
  String message;
  Data data;

  UserProfile({
    required this.statusCode,
    required this.message,
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
  int id;
  String fullName;
  String email;
  String phoneNumber;
  dynamic gender;
  String birthDate;
  String profilePictureUrl;
  String citizen;
  String role;
  dynamic token;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    this.gender,
    required this.birthDate,
    required this.profilePictureUrl,
    required this.citizen,
    required this.role,
    this.token,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        gender: json["gender"],
        birthDate: json["birth_date"],
        profilePictureUrl: json["profile_picture_url"],
        citizen: json["citizen"],
        role: json["role"],
        token: json["token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "phone_number": phoneNumber,
        "gender": gender,
        "birth_date": birthDate,
        "profile_picture_url": profilePictureUrl,
        "citizen": citizen,
        "role": role,
        "token": token,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
