// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';
import 'package:capstone_project_tripease/features_profile/model/response_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:capstone_project_tripease/features_profile/model/user_profile.dart';

class UserProfileService {
  final baseUrl =
      'http://ec2-3-26-30-178.ap-southeast-2.compute.amazonaws.com:8088/api/v1';
  final token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODU3MDA4NDAsInJvbGUiOiJ1c2VyIiwidXNlcklkIjoyMX0.BQIHnQeO1bDt6ySiPginrKv4TlKvoUZri5GlRYFLYlI';

  String _message = '';
  String get message => _message;

  Future<Data?> getUser() async {
    Data? result;

    try {
      var response = await http.post(
        Uri.parse('$baseUrl/user'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
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

  Future<ResponseModel> updateUser(String fullName, String phoneNumber,
      String birthDate, String citizen) async {
    ResponseModel responseModel = ResponseModel();

    final response = await http.put(
      Uri.parse('$baseUrl/user/update-profile'),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
      body: {
        'birth_date': birthDate,
        'citizen': citizen,
        'full_name': fullName,
        'phone_number': phoneNumber,
      },
    );
    final item = json.decode(response.body);
    switch (response.statusCode) {
      case 200:
        print(item["message"]);
        break;
      case 400:
        print(item["message"]);
        break;
      default:
        print(response.body);
        break;
    }
    return responseModel;
  }

  Future<ResponseModel> deletePicture() async {
    ResponseModel responseModel = ResponseModel();
    final response = await http.delete(
      Uri.parse('$baseUrl/user/delete-photo-profile'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    final item = json.decode(response.body);
    switch (response.statusCode) {
      case 200:
        print(item["message"]);
        break;
      case 400:
        print(item["message"]);
        break;
      default:
        print(response.body);
        break;
    }
    return responseModel;
  }

  Future<int> updatePhoto(File file, String filename) async {
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse('$baseUrl/user/update-photo-profile'),
    );
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
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
    print("request: " + request.toString());
    var res = await request.send();
    print("This is response:" + res.reasonPhrase.toString());

    return res.statusCode;
  }

  Future<void> updatePassword(
      String oldPassword, String newPassword, String confirmPassword) async {
    // final response = await http.put(
    //   Uri.parse('$baseUrl/user/update-password'),
    //   headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    //   body: {
    //     'confirm_password': confirmPassword,
    //     'new_password': newPassword,
    //     'old_password': oldPassword,
    //   },
    // );

    Dio dio = Dio();
    // final response = await dio.post(
    //   '$baseUrl/user/update-password',
    //   data: {
    //     'confirm_password': confirmPassword,
    //     'new_password': newPassword,
    //     'old_password': oldPassword,
    //   },
    //   options: Options(
    //     headers: {
    //       'Accept': 'application/json',
    //       'Authorization': 'Bearer $token',
    //     },
    //   ),
    // );

    // try {
    dio.options.headers['Authorization'] = 'Bearer $token';
    final response = await dio.put(
      '$baseUrl/user/update-password',
      data: {
        'confirm_password': confirmPassword,
        'new_password': newPassword,
        'old_password': oldPassword,
      },
    );
    // print('Password berhasil diperbarui');
    // switch (response.statusCode) {
    //   case 200:
    //     // final item = json.decode(response.statusMessage.toString());
    //     print('200000');
    //     break;
    //   case 400:
    //     print('4000000');
    //     break;
    //   default:
    //     print(response.data);
    //     break;
    // }
    // } catch (error) {
    //   // Jika terjadi kesalahan saat mengirim permintaan, Anda dapat menangani kesalahan di sini
    //   print('Terjadi kesalahan saat memperbarui password: $error');
    // }
  }
}
