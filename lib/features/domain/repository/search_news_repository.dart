import 'package:dartz/dartz.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/features/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/core/params/params.dart';

abstract class SearchNewsRepository{
  Future<Either<Failure, SearchNewsModel>> fetchSearchNewsData(Params params);
}