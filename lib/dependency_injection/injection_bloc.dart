part of 'injection.dart';

void blocs() {
  getIt.registerLazySingleton<ArticleBloc>(
    () => ArticleBloc(
      getIt(),
    ),
  );
}
