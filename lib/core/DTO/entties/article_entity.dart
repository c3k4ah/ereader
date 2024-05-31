import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final String? title;
  final String? originalTitle;
  final String? alternativeTitle;
  final String? content;
  final int? article;

  const ArticleEntity({
    this.title,
    this.originalTitle,
    this.alternativeTitle,
    this.content,
    this.article,
  });

  @override
  List<Object?> get props => [
        title,
        originalTitle,
        alternativeTitle,
        content,
        article,
      ];
}
