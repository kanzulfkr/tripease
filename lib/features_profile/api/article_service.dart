import 'dart:convert';

import 'package:capstone_project_tripease/features_profile/model/article.dart';
import 'package:http/http.dart' as http;

class ArticleService {
  final baseUrl = 'https://capstone.hanifz.com/api/v1';
  String _message = '';
  String get message => _message;
  // List<DataArticle> dataArticleList = [];
  //  List<Map<String, dynamic>> allTopics = [];

  Future<dynamic> getArticle() async {
    try {
      var response = await http.get(
        Uri.parse('$baseUrl/public/article'),
        headers: {
          'Accept': 'application/json',
        },
      );
      return response.body;
    } catch (e) {
      _message = e.toString();
    }
  }

  Future<dynamic> getTopics() async {
    try {
      var response = await http.get(
        Uri.parse('$baseUrl/public/article'),
        headers: {
          'Accept': 'application/json',
        },
      );
      return response;
    } catch (e) {
      _message = e.toString();
    }
  }

  Future<DataArticle?> getArticleById(int id) async {
    DataArticle? result;
    try {
      var response = await http.get(
        Uri.parse('$baseUrl/public/article/$id'),
        headers: {
          'Accept': 'application/json',
        },
      );
      final item = json.decode(response.body);
      result = DataArticle.fromJson(item['data']);
    } catch (e) {
      _message = e.toString();
    }
    return result;
  }
}
