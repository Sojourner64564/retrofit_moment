import 'package:dartz/dartz.dart';
import 'package:retrofit_moment/core/enums/save_response.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_data_entity/search_news_data_entity.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_entity/search_news_entity.dart';


abstract class DbSearchNewsRepository{
  Future<Either<Failure, SaveResponse>> saveSearchNewsModel({required SearchNewsEntity searchNewsEntity, required String queryString, required  String saveData});
  Future<Either<Failure, List<SearchNewsDataEntity>>> loadSearchNewsAllNews();
  Future<Either<Failure, SearchNewsEntity>> loadSearchNewsByIdModel({required int id});
}