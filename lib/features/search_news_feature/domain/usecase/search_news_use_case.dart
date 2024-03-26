import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/repository/search_news_repository.dart';

@injectable
class SearchNewsUseCase implements SearchNewsRepository {
  SearchNewsUseCase(this.searchNewsRepository);

  final SearchNewsRepository searchNewsRepository;

  @override
  Future<Either<Failure, SearchNewsModel>> fetchSearchNewsData({
    required String apiKey,
    required String keyword,
  }) async {
    return await searchNewsRepository.fetchSearchNewsData(apiKey: apiKey, keyword: keyword);
  }
}
