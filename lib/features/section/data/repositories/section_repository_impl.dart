import 'package:dartz/dartz.dart';

import '../../../../core/DTO/entities/article_entity.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repository/section_repository.dart';
import '../datasources/remote/remote_data_source.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final RemoteDataSource remote;

  ArticleRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<ArticleEntity>>> getAllArticle() async {
    try {
      final result = await remote.getAllArticle();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(info: e.toString()));
    }
  }
}
