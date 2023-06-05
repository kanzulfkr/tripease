import 'dart:convert';
import 'dart:io';
import 'package:capstone_project_tripease/onboard_feature/utils/token_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:capstone_project_tripease/features_profile/model/user_profile.dart';

class UserProfileService {
  final baseUrl = 'https://capstone.hanifz.com/api/v1';

  String _message = '';
  String get message => _message;

  Future<Data?> getUser() async {
    Data? result;
    String? tokens = await TokenManager.getToken();
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/user'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokens'
        },
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = Data.fromJson(item['data']);
      } else {
        final errorMessage = json.decode(response.body);
        _message = errorMessage;
      }
    } catch (e) {
      _message = e.toString();
    }
    return result;
  }

  Future<String> updateUser(String fullName, String phoneNumber,
      String birthDate, String citizen) async {
    // ResponseModel responseModel = ResponseModel();
    String? tokens = await TokenManager.getToken();
    final response = await http.put(
      Uri.parse('$baseUrl/user/update-profile'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens'
      },
      body: {
        'birth_date': birthDate,
        'citizen': citizen,
        'full_name': fullName,
        'phone_number': phoneNumber,
      },
    );
    // final item = json.decode(response.body);
    // switch (response.statusCode) {
    //   case 200:
    //     print(item["message"]);
    //     break;
    //   case 400:
    //     print(item["message"]);
    //     break;
    //   default:
    //     print(response.body);
    //     break;
    // }
    return response.statusCode.toString();
  }

  Future<String> deletePicture() async {
    String? tokens = await TokenManager.getToken();
    final response = await http.delete(
      Uri.parse('$baseUrl/user/delete-photo-profile'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $tokens',
      },
    );
    // final item = json.decode(response.body);
    // switch (response.statusCode) {
    //   case 200:
    //     print(item["message"]);
    //     break;
    //   case 400:
    //     print(item["message"]);
    //     break;
    //   default:
    //     print(response.body);
    //     break;
    // }
    return response.statusCode.toString();
  }

  Future<int> updatePhoto(File file, String filename) async {
    String? tokens = await TokenManager.getToken();
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse('$baseUrl/user/update-photo-profile'),
    );
    Map<String, String> headers = {
      "Authorization": "Bearer $tokens",
      "Content-type": "multipart/form-data"
    };
    request.files.add(
      http.MultipartFile(
        'file',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: filename,
        // contentType: MediaType('image', 'jpeg'),
      ),
    );
    request.headers.addAll(headers);
    debugPrint("request: $request");
    var res = await request.send();
    debugPrint("This is response:${res.reasonPhrase}");

    return res.statusCode;
  }

  Future<String> updatePassword(
      String oldPassword, String newPassword, String confirmPassword) async {
    String? tokens = await TokenManager.getToken();
    ;
    Dio dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $tokens';
    final response = await dio.put(
      '$baseUrl/user/update-password',
      data: {
        'confirm_password': confirmPassword,
        'new_password': newPassword,
        'old_password': oldPassword,
      },
    );

    // if (response.statusCode == 200) {
    //   final item = json.decode(response.data);
    //   responseModel = ResponseModel.fromJson(item['statusCode']);
    // } else if (response.statusCode == 400) {
    //   final item = json.decode(response.data);
    //   responseModel = ResponseModel.fromJson(item['statusCode']);
    // }
    // } catch (e) {
    //   print('asdasdasd');
    //   // print(e.toString());
    // }
    // print('${response.statusCode.toString()}');

    return response.statusCode.toString();
  }
}
