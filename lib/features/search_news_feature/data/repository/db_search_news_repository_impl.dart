import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/enums/save_response.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/network/network_info.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_models/search_news/extension/extension_search_news_data_model_to_entity.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/extension/extension_search_news_model_to_entity.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_data_entity/search_news_data_entity.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_entity/extension/extension_search_news_entity_to_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_entity/search_news_entity.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/repository/db_search_news_repository.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_source/search_news_data_source_local.dart';

@LazySingleton(as: DbSearchNewsRepository)
class DbSearchNewsRepositoryImpl implements DbSearchNewsRepository {
  DbSearchNewsRepositoryImpl(
    this.networkInfo,
    this.searchNewsDataSourceLocal,
  );

  final NetworkInfo networkInfo;
  final SearchNewsDataSourceLocal searchNewsDataSourceLocal;

  @override
  Future<Either<Failure, List<SearchNewsDataEntity>>>
      loadSearchNewsAllNews() async {
    try {
      final returnVariable = await searchNewsDataSourceLocal.loadAllNews();
      final answer = returnVariable.map((e) => e.toEntity()).toList();
      return Right(answer);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, SaveResponse>> saveSearchNewsModel({
    required SearchNewsEntity searchNewsEntity,
    required String queryString,
  }) async {
    final lastQueryWord =
    await searchNewsDataSourceLocal.selectQueryLastModel();//---------------------
    final searchNewsModel = searchNewsEntity.toModel();
    final String saveData = DateFormat("dd-MM-yyyy – kk:mm").format(DateTime.now());
    try {
      final lastQueryWord =
          await searchNewsDataSourceLocal.selectQueryLastModel();
      if(searchNewsEntity.news.isEmpty){
        return const Right(SaveResponse.emptyList);
      }
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
      print(e);
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, SearchNewsEntity>> loadSearchNewsByIdModel({
    required int id,
  }) async {
    try {
      final returnVariable =
          await searchNewsDataSourceLocal.selectSearchNewsModelById(id);
      final answer = returnVariable.toEntity();
      return Right(answer);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }
}
