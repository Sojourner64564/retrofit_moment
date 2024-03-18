import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/enums/save_response.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/network/network_info.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/params.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_models/search_news_data_model.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_source/search_news_data_source_local.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_source/search_news_data_source_remote.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/data/search_news_local_drift_database/search_news_local_drift_database.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/repository/search_news_repository.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/lenght_search_news_from_db_params.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/load_all_news_params.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/load_saved_search_news_params.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/save_model_to_db_params.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/select_last_model_from_db_params.dart';

@LazySingleton(as: SearchNewsRepository)
class SearchNewsRepositoryImpl implements SearchNewsRepository {
  SearchNewsRepositoryImpl(this.networkInfo,
      this.searchNewsClientDataSourceRemote, this.searchNewsDataSourceLocal);

  final NetworkInfo networkInfo;
  final SearchNewsClientDataSourceRemote searchNewsClientDataSourceRemote;
  final SearchNewsDataSourceLocal searchNewsDataSourceLocal;

  @override
  Future<Either<Failure, SearchNewsModel>> fetchSearchNewsData(
      Params params) async {
    if (await networkInfo.isConnected) {
      final searchNews = await searchNewsClientDataSourceRemote
          .client()
          .fetchSearchNews(params.apiKey, params.keywords);
      return Right(searchNews);
    } else {
      return Left(ServerFailure());
    }
  }

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
  Future<Either<Failure, SaveResponse>> saveSearchNewsModel(
      SaveModelToDbParams saveModelToDbParams) async {
    try {
      final lastQueryWord =
          await searchNewsDataSourceLocal.selectQueryLastModel();
      if (lastQueryWord == null) {
        await searchNewsDataSourceLocal.saveModelToBd(
          saveModelToDbParams.searchNewsModel,
          saveModelToDbParams.queryString,
          saveModelToDbParams.saveData,
        );
        return const Right(SaveResponse.saved);
      }
      if (lastQueryWord == saveModelToDbParams.queryString) {
        return const Right(SaveResponse.alreadySaved);
      }
      await searchNewsDataSourceLocal.saveModelToBd(
        saveModelToDbParams.searchNewsModel,
        saveModelToDbParams.queryString,
        saveModelToDbParams.saveData,
      );
      return const Right(SaveResponse.saved);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, SearchNewsModel>> selectSearchNewsLastModel(
      SelectLastModelFromBdParams selectLastModelFromBdParams) async {
    try {
      final returnVariable =
          await searchNewsDataSourceLocal.selectLastModelFromBd();
      return Right(returnVariable);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, SearchNewsModel>> loadSearchNewsByIdModel(
      LoadSavedSearchNewsParams loadSavedSearchNewsParams) async {
    try {
      final returnVariable = await searchNewsDataSourceLocal
          .selectSearchNewsModelById(loadSavedSearchNewsParams.id);
      return Right(returnVariable);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }


}
