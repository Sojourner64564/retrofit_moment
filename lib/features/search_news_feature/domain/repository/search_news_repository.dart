import 'package:dartz/dartz.dart';
import 'package:retrofit_moment/core/enums/save_response.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/params.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_models/search_news_data_model.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/lenght_search_news_from_db_params.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/load_saved_search_news_params.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/save_model_to_db_params.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/select_last_model_from_db_params.dart';

abstract class SearchNewsRepository{
  Future<Either<Failure, SearchNewsModel>> fetchSearchNewsData(Params params);
  Future<Either<Failure, SaveResponse>> saveSearchNewsModel(SaveModelToDbParams saveModelToDbParams);
  Future<Either<Failure, SearchNewsModel>> selectSearchNewsLastModel(SelectLastModelFromBdParams selectLastModelFromBdParams);
  Future<Either<Failure, int>> lenghtSearchNews(LenghtSearchNewsFromDbParams lenghtSearchNewsFromDbParams);
  Future<Either<Failure, List<SearchNewsDataModel>>> loadSearchNewsAllNews();
  Future<Either<Failure, SearchNewsModel>> loadSearchNewsByIdModel(LoadSavedSearchNewsParams loadSavedSearchNewsParams);
}