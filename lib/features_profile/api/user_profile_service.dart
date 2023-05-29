import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class UserProfileService {
  var baseUrl =
      "http://ec2-3-26-30-178.ap-southeast-2.compute.amazonaws.com:8088/api/v1/user";
  var token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODUzNzA4NTMsInJvbGUiOiJ1c2VyIiwidXNlcklkIjo1fQ.aUK7WYvOQn2UQiihHUYUuwd2WhKM9qR9NjXz6LmDC0A";

  // fetch data using Dio()
  Future<void> getUserDetailWithDio() async {
    try {
      final response = await Dio().post(
        "http://ec2-3-26-30-178.ap-southeast-2.compute.amazonaws.com:8088/api/v1/user",
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODUzNzA4NTMsInJvbGUiOiJ1c2VyIiwidXNlcklkIjo1fQ.aUK7WYvOQn2UQiihHUYUuwd2WhKM9qR9NjXz6LmDC0A',
        }),
      );

      if (response.statusCode == 200) {
        print(response.data);
        print("${response.data['message']}");
      } else {
        print("${response.data['message']}");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // fetch data using http
  Future<Map<String, dynamic>> getUserDetailWithHttp() async {
    try {
      var baseUrl =
          "http://ec2-3-26-30-178.ap-southeast-2.compute.amazonaws.com:8088/api/v1/user";
      var token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJleHAiOjE2ODUzNzA4NTMsInJvbGUiOiJ1c2VyIiwidXNlcklkIjo1fQ.aUK7WYvOQn2UQiihHUYUuwd2WhKM9qR9NjXz6LmDC0A";
      var response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        print('${response.body}');
      } else {
        print('zzzzzzzzzzzzzzz');
      }

      var checkResponse = json.decode(response.body) as Map<String, dynamic>;
      return checkResponse;
    } catch (e) {
      throw Exception(e);
    }
  }
}
