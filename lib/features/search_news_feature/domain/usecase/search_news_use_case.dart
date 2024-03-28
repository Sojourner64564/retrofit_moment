import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_entity/search_news_entity.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/repository/search_news_repository.dart';

@injectable
class SearchNewsUseCase implements SearchNewsRepository {
  SearchNewsUseCase(this.searchNewsRepository);

  final SearchNewsRepository searchNewsRepository;

  @override
  Future<Either<Failure, SearchNewsEntity>> fetchSearchNewsData({
    required String keyword,
  }) async {
    return await searchNewsRepository.fetchSearchNewsData(keyword: keyword);
  }
}
