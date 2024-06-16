import 'package:dartz/dartz.dart';

import '../../../../core/DTO/entities/article_entity.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/section_repository.dart';

class GetAllArticleUseCase extends Usecase<List<ArticleEntity>, NoParams> {
  final ArticleRepository repository;
  GetAllArticleUseCase(
    this.repository,
  );

  @override
  Future<Either<Failure, List<ArticleEntity>>> call(NoParams params) async {
    return await repository.getAllArticle();
  }
}
