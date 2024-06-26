import 'package:dartz/dartz.dart';

import '../../../../core/DTO/entities/article_entity.dart';
import '../../../../core/error/failure.dart';

abstract class ArticleRepository {
  Future<Either<Failure, List<ArticleEntity>>> getAllArticle();
}
