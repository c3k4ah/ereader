import '../entties/article_entity.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    String? title,
    String? originalTitle,
    String? alternativeTitle,
    String? content,
    int? article,
  }) : super(
          title: title,
          originalTitle: originalTitle,
          alternativeTitle: alternativeTitle,
          content: content,
          article: article,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['titre'] ?? "",
      originalTitle: json['titre_original'] ?? "",
      alternativeTitle: json['titre_alternatif'] ?? "",
      content: json['contenu'] ?? "",
      article: json['article'] ?? 0,
    );
  }
}
