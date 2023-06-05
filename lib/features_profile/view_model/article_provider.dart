import 'dart:convert';

import 'package:capstone_project_tripease/features_profile/api/article_service.dart';
import 'package:capstone_project_tripease/features_profile/model/article.dart';
import 'package:flutter/material.dart';

class ArticleProvider extends ChangeNotifier {
  bool loading = false;
  List<DataArticle> listAllArticle = [];
  DataArticle? articleById;
  List<dynamic> article = [];
  List<dynamic> get allArticle => article;

  Future<void> getAllArticle() async {
    loading = true;
    var response = await ArticleService().getArticle();
    listAllArticle = Article.fromJson(json.decode(response)).data;
    loading = false;

    notifyListeners();
  }

  Future<void> getArticleById(int id) async {
    loading = true;
    articleById = (await ArticleService().getArticleById(id))!;
    loading = false;

    notifyListeners();
  }

  Future<void> getSearchArticle() async {
    loading = true;
    var response = await ArticleService().getTopics();
    loading = false;
    final item = json.decode(response.body);
    article = item['data'];
    notifyListeners();
  }
}
