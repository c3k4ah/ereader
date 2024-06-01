import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/DTO/entties/article_entity.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_all_article_usecase.dart';

part "article_event.dart";
part "article_state.dart";

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetAllArticleUseCase getAllArticleUseCase;

  ArticleBloc(this.getAllArticleUseCase) : super(InitialState()) {
    on<GetAllArticleEvent>(_onGetAllArticleEvent);
  }

  Future<void> _onGetAllArticleEvent(
      GetAllArticleEvent event, Emitter<ArticleState> emit) async {
    emit(state.copyWith(status: ArticleStatus.loading));
    final result = await getAllArticleUseCase(NoParams());
    result.fold((l) {
      emit(
        state.copyWith(
          status: ArticleStatus.error,
          error: l.message,
        ),
      );
    }, (r) {
      emit(
        state.copyWith(
          status: ArticleStatus.loaded,
          articles: r,
        ),
      );
    });
  }
}
