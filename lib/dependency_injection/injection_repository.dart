part of 'injection.dart';

void repositories() {
  // Repositories
  getIt.registerLazySingleton<ArticleRepository>(
    () => ArticleRepositoryImpl(
      getIt(),
    ),
  );
}
