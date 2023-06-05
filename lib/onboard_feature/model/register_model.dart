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
