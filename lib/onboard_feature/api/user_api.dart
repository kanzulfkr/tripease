
import '/onboard_feature/model/register_model.dart';
import '/onboard_feature/model/user_model.dart';
import '/onboard_feature/utils/token_manager.dart';
import 'package:dio/dio.dart';

class UserApi {
  String urlLogin = 'https://capstone.hanifz.com/api/v1/login';
  String urlRegister = 'https://capstone.hanifz.com/api/v1/register';

  var error = '';
  var message = '';
  // how to login and get token

  Future<UserResponseModel> login(String email, String password) async {
    final response = await Dio().post(
      urlLogin,
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      print('response: ${response.data}');

      final token = response.data['data']['token'];
      TokenManager.saveToken(token);

      return UserResponseModel.fromJson(response.data);
    } else if (response.statusCode == 400) {
      error = response.statusMessage.toString();

      print('error: $error');

      return UserResponseModel.fromJson(response.data);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<UserRegisterResponseModel> register(
      UserRegisterResponseModel registerData,
      ) async {
    final response = await Dio().post(
      urlRegister,
      data: registerData.toJson(),
    );

    if (response.statusCode == 201) {
      print('response: ${response.data}');
      return UserRegisterResponseModel.fromJson(response.data);
    } else {
      throw Exception('response: ${response.statusMessage}');
    }
  }
}
