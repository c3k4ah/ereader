import 'package:get_it/get_it.dart';

import '../features/section/data/datasources/remote/remote_data_source.dart';
import '../features/section/data/repositories/section_repository_impl.dart';
import '../features/section/domain/repository/section_repository.dart';
import '../features/section/domain/usecases/get_all_article_usecase.dart';
import '../features/section/presentation/manager/article_bloc.dart';

part 'injection_bloc.dart';

part 'injection_usecase.dart';

part 'injection_repository.dart';

part 'injection_datasource.dart';

final getIt = GetIt.instance;

Future<void> initInjection() async {
  blocs();
  await service();
  datasources();
  repositories();
  usecases();
  externalResources();
}

Future<void> service() async {
  // final dio = Dio(
  //   BaseOptions(
  //     baseUrl: '${ConstString.baseUrl}/api/',
  //     headers: {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer ${store.token}',
  //     },
  //   ),
  // );
}

void externalResources() {}
