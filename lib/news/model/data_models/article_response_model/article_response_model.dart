import 'dart:convert';

import 'package:news_app/news/model/data_models/source_model.dart';

class ArticleResponseModel {
  String? status;
  List<Article>? articles;

  ArticleResponseModel({this.status, this.articles});

  factory ArticleResponseModel.fromMap(Map<String, dynamic> data) {
    return ArticleResponseModel(
      status: data['status'] as String?,
      articles: (data['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromMap(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
    'status': status,
    'articles': articles?.map((e) => e.toMap()).toList(),
  };

  factory ArticleResponseModel.fromJson(String data) {
    return ArticleResponseModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  String toJson() => json.encode(toMap());
}

class Article {
  Sources? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromMap(Map<String, dynamic> data) {
    return Article(
      source: data['source'] == null
          ? null
          : Sources.fromJson(Map<String, dynamic>.from(data['source'])),
      author: data['author'] as String?,
      title: data['title'] as String?,
      description: data['description'] as String?,
      url: data['url'] as String?,
      urlToImage: data['urlToImage'] as String?,
      publishedAt: data['publishedAt'] as String?,
      content: data['content'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
    'source': source?.toJson(),
    'author': author,
    'title': title,
    'description': description,
    'url': url,
    'urlToImage': urlToImage,
    'publishedAt': publishedAt,
    'content': content,
  };
}
