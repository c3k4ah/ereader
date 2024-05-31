part of "article_bloc.dart";

sealed class ArticleEvent extends Equatable {
  const ArticleEvent();
  @override
  List<Object> get props => [];
}

class GetAllArticleEvent extends ArticleEvent {
  const GetAllArticleEvent();
  @override
  List<Object> get props => [];
}
