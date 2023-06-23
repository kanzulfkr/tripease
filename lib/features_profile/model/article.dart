import 'dart:convert';

class Article {
  int statusCode;
  String message;
  List<DataArticle> data;

  Article({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory Article.fromRawJson(String str) => Article.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        statusCode: json["status_code"],
        message: json["message"],
        data: List<DataArticle>.from(
            json["data"].map((x) => DataArticle.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataArticle {
  int? articleId;
  String? title;
  String? image;
  String? description;
  String? label;
  String? slug;

  DataArticle({
    this.articleId,
    this.title,
    this.image,
    this.description,
    this.label,
    this.slug,
  });

  factory DataArticle.fromRawJson(String str) =>
      DataArticle.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataArticle.fromJson(Map<String, dynamic> json) => DataArticle(
        articleId: json["article_id"],
        title: json["title"],
        image: json["image"],
        description: json["description"],
        label: json["label"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "article_id": articleId,
        "title": title,
        "image": image,
        "description": description,
        "label": label,
        "slug": slug,
      };
}
