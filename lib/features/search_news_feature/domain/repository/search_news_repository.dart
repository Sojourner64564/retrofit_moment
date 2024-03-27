import 'package:dartz/dartz.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_entity/search_news_entity.dart';


abstract class SearchNewsRepository{
  Future<Either<Failure, SearchNewsEntity>> fetchSearchNewsData({required String apiKey, required String keyword});
}