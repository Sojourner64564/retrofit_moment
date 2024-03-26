import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/enums/save_response.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_models/search_news_data_model.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/repository/db_search_news_repository.dart';

@lazySingleton
class DbSearchNewsUseCase implements DbSearchNewsRepository {
  final DbSearchNewsRepository dbSearchNewsRepository;
  DbSearchNewsUseCase(this.dbSearchNewsRepository);

  @override
  Future<Either<Failure, List<SearchNewsDataModel>>>
      loadSearchNewsAllNews() async {
    return dbSearchNewsRepository.loadSearchNewsAllNews();
  }

  @override
  Future<Either<Failure, SearchNewsModel>> loadSearchNewsByIdModel({
    required int id,
  }) async {
    return await dbSearchNewsRepository.loadSearchNewsByIdModel(id: id);
  }

  @override
  Future<Either<Failure, SaveResponse>> saveSearchNewsModel({
    required SearchNewsModel searchNewsModel,
      required String queryString,
      required String saveData,
  }) async {
    return await dbSearchNewsRepository.saveSearchNewsModel(
        searchNewsModel: searchNewsModel,
        queryString: queryString,
        saveData: saveData);
  }
}
