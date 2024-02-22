import 'package:dartz/dartz.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/params/params.dart';
import 'package:retrofit_moment/features/latest_news_feature/data/models/latest_news/latest_news_model.dart';

abstract class LatestNewsRepository{
Future<Either<Failure, LatestNewsModel>> fetchLatestNewsData(Params params);
}