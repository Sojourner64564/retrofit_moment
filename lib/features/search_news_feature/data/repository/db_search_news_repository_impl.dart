import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/enums/save_response.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/network/network_info.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/repository/db_search_news_repository.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_models/search_news_data_model.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_source/search_news_data_source_local.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';

@LazySingleton(as: DbSearchNewsRepository)
class DbSearchNewsRepositoryImpl implements DbSearchNewsRepository {
  DbSearchNewsRepositoryImpl(
    this.networkInfo,
    this.searchNewsDataSourceLocal,
  );

  final NetworkInfo networkInfo;
  final SearchNewsDataSourceLocal searchNewsDataSourceLocal;

  @override
  Future<Either<Failure, List<SearchNewsDataModel>>>
      loadSearchNewsAllNews() async {
    try {
      final returnVariable = await searchNewsDataSourceLocal.loadAllNews();
      return Right(returnVariable);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, SaveResponse>> saveSearchNewsModel({
    required SearchNewsModel searchNewsModel,
    required String queryString,
    required String saveData,
  }) async {
    try {
      final lastQueryWord =
          await searchNewsDataSourceLocal.selectQueryLastModel();
      if (lastQueryWord == null) {
        await searchNewsDataSourceLocal.saveModelToBd(
          searchNewsModel,
          queryString,
          saveData,
        );
        return const Right(SaveResponse.saved);
      }
      if (lastQueryWord == queryString) {
        return const Right(SaveResponse.alreadySaved);
      }
      await searchNewsDataSourceLocal.saveModelToBd(
        searchNewsModel,
        queryString,
        saveData,
      );
      return const Right(SaveResponse.saved);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, SearchNewsModel>> loadSearchNewsByIdModel({
    required int id,
  }) async {
    try {
      final returnVariable =
          await searchNewsDataSourceLocal.selectSearchNewsModelById(id);
      return Right(returnVariable);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }
}
