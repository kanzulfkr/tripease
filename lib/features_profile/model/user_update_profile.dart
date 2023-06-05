import 'dart:convert';

class UserProfileUpdate {
  String? birthDate;
  String? citizen;
  String fullName;
  String? phoneNumber;

  UserProfileUpdate({
    this.birthDate,
    this.citizen,
    required this.fullName,
    this.phoneNumber,
  });

  factory UserProfileUpdate.fromRawJson(String str) =>
      UserProfileUpdate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserProfileUpdate.fromJson(Map<String, dynamic> json) =>
      UserProfileUpdate(
        // birthDate: DateTime.parse(json["birth_date"]),
        birthDate: json['birth_date'],
        citizen: json["citizen"],
        fullName: json["full_name"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        // "birth_date":
        //     "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "birth_date": birthDate,
        "citizen": citizen,
        "full_name": fullName,
        "phone_number": phoneNumber,
      };
}
