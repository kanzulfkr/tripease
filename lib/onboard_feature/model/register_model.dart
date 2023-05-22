// import 'dart:convert';

// UserRegisterResponseModel userRegisterResponseModelFromJson(String str) =>
//     UserRegisterResponseModel.fromJson(json.decode(str));

// String userRegisterResponseModelToJson(UserRegisterResponseModel data) =>
//     json.encode(data.toJson());

// class UserRegisterResponseModel {
//   Data? data;
//   String? message;
//   int? statusCode;

//   UserRegisterResponseModel({
//     this.data,
//     this.message,
//     this.statusCode,
//   });

//   factory UserRegisterResponseModel.fromJson(Map<String, dynamic> json) =>
//       UserRegisterResponseModel(
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//         message: json["message"],
//         statusCode: json["status_code"],
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data?.toJson(),
//         "message": message,
//         "status_code": statusCode,
//       };
// }

// class Data {
//   DateTime? birthDate;
//   String? citizen;
//   DateTime? createdAt;
//   String email;
//   String fullName;
//   String? gender;
//   int? id;
//   String phoneNumber;
//   String? profilePicture;
//   String? role;
//   String? token;
//   DateTime? updatedAt;
//   String password;
//   String confirmPassword;

//   Data({
//     this.birthDate,
//     this.citizen,
//     this.createdAt,
//     required this.email,
//     required this.fullName,
//     this.gender,
//     this.id,
//     required this.phoneNumber,
//     this.profilePicture,
//     this.role,
//     this.token,
//     this.updatedAt,
//     required this.password,
//     required this.confirmPassword,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         birthDate: json["birth_date"] == null
//             ? null
//             : DateTime.parse(json["birth_date"]),
//         citizen: json["citizen"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         email: json["email"],
//         fullName: json["full_name"],
//         gender: json["gender"],
//         id: json["id"],
//         phoneNumber: json["phone_number"],
//         profilePicture: json["profile_picture"],
//         role: json["role"],
//         token: json["token"],
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         password: json["password"],
//         confirmPassword: json["confirm_password"],
//       );

//   Map<String, dynamic> toJson() => {
//         "birth_date":
//             "${birthDate?.year.toString().padLeft(4, '0')}-${birthDate?.month.toString().padLeft(2, '0')}-${birthDate?.day.toString().padLeft(2, '0')}",
//         "citizen": citizen,
//         "created_at": createdAt?.toIso8601String(),
//         "email": email,
//         "full_name": fullName,
//         "gender": gender,
//         "id": id,
//         "phone_number": phoneNumber,
//         "profile_picture": profilePicture,
//         "role": role,
//         "token": token,
//         "updated_at": updatedAt?.toIso8601String(),
//         "password": password,
//         "confirm_password": confirmPassword,
//       };
// }

class UserRegisterResponseModel {
  String confirmPassword;
  String email;
  String fullName;
  String password;
  String phoneNumber;

  UserRegisterResponseModel({
    required this.confirmPassword,
    required this.email,
    required this.fullName,
    required this.password,
    required this.phoneNumber,
  });

  factory UserRegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      UserRegisterResponseModel(
        confirmPassword: json["confirm_password"],
        email: json["email"],
        fullName: json["full_name"],
        password: json["password"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "confirm_password": confirmPassword,
        "email": email,
        "full_name": fullName,
        "password": password,
        "phone_number": phoneNumber,
      };
}
