part of 'injection.dart';

void usecases() {
  // Authentification
  getIt.registerLazySingleton<GetAllArticleUseCase>(
    () => GetAllArticleUseCase(
      getIt(),
    ),
  );
}
