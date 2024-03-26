import 'package:dartz/dartz.dart';
import 'package:retrofit_moment/core/enums/save_response.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_models/search_news_data_model.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';


abstract class DbSearchNewsRepository{
  Future<Either<Failure, SaveResponse>> saveSearchNewsModel({required SearchNewsModel searchNewsModel, required String queryString, required  String saveData});
  Future<Either<Failure, List<SearchNewsDataModel>>> loadSearchNewsAllNews();
  Future<Either<Failure, SearchNewsModel>> loadSearchNewsByIdModel({required int id});
}