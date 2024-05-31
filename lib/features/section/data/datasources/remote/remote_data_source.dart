import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../../../core/DTO/models/article_model.dart';

abstract class RemoteDataSource {
  Future<List<ArticleModel>> getAllArticle();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<List<ArticleModel>> getAllArticle() async {
    String jsonString =
        await rootBundle.loadString('assets/data/contents.json');
    Map<String, dynamic> jsonResult = jsonDecode(jsonString);

    List<ArticleModel> result = (jsonResult['chapitres'] as List)
        .map((e) => ArticleModel.fromJson(e))
        .toList();

    return result;
  }
}
