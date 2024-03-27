import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/enums/save_response.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_data_entity/search_news_data_entity.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_entity/search_news_entity.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/repository/db_search_news_repository.dart';

@lazySingleton
class DbSearchNewsUseCase implements DbSearchNewsRepository {
  final DbSearchNewsRepository dbSearchNewsRepository;
  DbSearchNewsUseCase(this.dbSearchNewsRepository);

  @override
  Future<Either<Failure, List<SearchNewsDataEntity>>>
      loadSearchNewsAllNews() async {
    return dbSearchNewsRepository.loadSearchNewsAllNews();
  }

  @override
  Future<Either<Failure, SearchNewsEntity>> loadSearchNewsByIdModel({
    required int id,
  }) async {
    return await dbSearchNewsRepository.loadSearchNewsByIdModel(id: id);
  }

  @override
  Future<Either<Failure, SaveResponse>> saveSearchNewsModel({
    required SearchNewsEntity searchNewsEntity,
      required String queryString,
  }) async {
    return await dbSearchNewsRepository.saveSearchNewsModel(
        searchNewsEntity: searchNewsEntity,
        queryString: queryString,
        );
  }
}
