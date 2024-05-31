part of 'injection.dart';

void datasources() {
  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
}
