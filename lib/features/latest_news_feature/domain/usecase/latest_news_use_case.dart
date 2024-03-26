import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/features/latest_news_feature/data/models/latest_news/latest_news_model.dart';
import 'package:retrofit_moment/features/latest_news_feature/domain/repository/latest_news_repository.dart';

@injectable
class LatestNewsUseCase implements LatestNewsRepository{
  LatestNewsUseCase(this.latestNewsRepository);
  final LatestNewsRepository latestNewsRepository;

  @override
  Future<Either<Failure, LatestNewsModel>> fetchLatestNewsData({required String apiKey}) async{
    return await latestNewsRepository.fetchLatestNewsData(apiKey: apiKey);
  }

}