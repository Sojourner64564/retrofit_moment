import 'package:dartz/dartz.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/features/latest_news_feature/domain/entity/latest_news_entity.dart';

abstract class LatestNewsRepository{
Future<Either<Failure, LatestNewsEntity>> fetchLatestNewsData({required String apiKey});
}