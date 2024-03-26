import 'package:dartz/dartz.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';


abstract class SearchNewsRepository{
  Future<Either<Failure, SearchNewsModel>> fetchSearchNewsData({required String apiKey, required String keyword});
}