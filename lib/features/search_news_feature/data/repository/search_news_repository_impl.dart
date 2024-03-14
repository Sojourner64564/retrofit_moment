import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/network/network_info.dart';
import 'package:retrofit_moment/core/params/params.dart';
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
class SearchNewsRepositoryImpl implements SearchNewsRepository{
  SearchNewsRepositoryImpl(this.networkInfo, this.searchNewsClientDataSourceRemote, this.searchNewsDataSourceLocal);

  final NetworkInfo networkInfo;
  final SearchNewsClientDataSourceRemote searchNewsClientDataSourceRemote;
  final SearchNewsDataSourceLocal searchNewsDataSourceLocal;

  @override
  Future<Either<Failure, SearchNewsModel>> fetchSearchNewsData(Params params) async{
    if(await networkInfo.isConnected){
      final searchNews = await searchNewsClientDataSourceRemote.client().fetchSearchNews(params.apiKey, params.keywords);
      return Right(searchNews);
    }else{
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, Database> getSearchNewsDb() {
    try{
      final db = searchNewsDataSourceLocal.getDb();
      return Right(db);
    }catch(e){
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, int>> lenghtSearchNews(LenghtSearchNewsFromDbParams lenghtSearchNewsFromDbParams) async{
    try{
      final returnVariable = await searchNewsDataSourceLocal.lenghtOfSearchNewsFromDb(lenghtSearchNewsFromDbParams.database);
      return Right(returnVariable);
    }catch(e){
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<SearchNewsDataModel>>> loadSearchNewsAllNews(LoadAllNewsParams loadAllNewsParams) async{
    try{
      final returnVariable = await searchNewsDataSourceLocal.loadAllNews(loadAllNewsParams.database);
      return Right(returnVariable);
    }catch(e){
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<void> saveSearchNewsModel(SaveModelToDbParams saveModelToDbParams) async{
    try{
       await searchNewsDataSourceLocal.saveModelToBd(saveModelToDbParams.database,
          saveModelToDbParams.searchNewsModel, saveModelToDbParams.queryString, saveModelToDbParams.saveData);
    }catch(e){}
  }

  @override
  Future<Either<Failure, SearchNewsModel>> selectSearchNewsLastModel(SelectLastModelFromBdParams selectLastModelFromBdParams) async{
    try{
      final returnVariable = await searchNewsDataSourceLocal.selectLastModelFromBd(selectLastModelFromBdParams.database);
      return Right(returnVariable);
    }catch(e){
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, SearchNewsModel>> loadSearchNewsModel(LoadSavedSearchNewsParams loadSavedSearchNewsParams) async{
    try{
      final returnVariable = await searchNewsDataSourceLocal.selectSearchNewsModelById(loadSavedSearchNewsParams.database, loadSavedSearchNewsParams.id);
      return Right(returnVariable);
    }catch(e){
      return Left(DatabaseFailure());
    }
  }

}