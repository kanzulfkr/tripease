import '/onboard_feature/model/register_model.dart';
import '/onboard_feature/model/user_model.dart';
import '/onboard_feature/utils/token_manager.dart';
import 'package:dio/dio.dart';

class UserApi {
  String urlLogin =
      'http://ec2-3-26-30-178.ap-southeast-2.compute.amazonaws.com:8088/api/v1/login';
  String urlRegister =
      'http://ec2-3-26-30-178.ap-southeast-2.compute.amazonaws.com:8088/api/v1/register';

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
      print('token: $token');
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
