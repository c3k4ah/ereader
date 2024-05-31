part of "article_bloc.dart";

class ArticleState extends Equatable {
  final List<ArticleEntity> articles;
  final ArticleStatus status;
  final String? error;

  const ArticleState({
    required this.articles,
    required this.status,
    this.error,
  });

  ArticleState copyWith({
    List<ArticleEntity>? articles,
    ArticleStatus? status,
    String? error,
  }) {
    return ArticleState(
      articles: articles ?? this.articles,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        articles,
        status,
        error,
      ];
}

class InitialState extends ArticleState {
  InitialState()
      : super(
          articles: [],
          status: ArticleStatus.initial,
        );
}

enum ArticleStatus {
  initial,
  loading,
  loaded,
  error,
}
