import 'package:dartz/dartz.dart';

import 'package:ereader/core/DTO/entties/article_entity.dart';

import 'package:ereader/core/error/failure.dart';

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
