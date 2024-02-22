import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/usecase/use_case.dart';
import 'package:retrofit_moment/core/params/params.dart';
import 'package:retrofit_moment/features/latest_news_feature/data/models/latest_news/latest_news_model.dart';
import 'package:retrofit_moment/features/latest_news_feature/domain/repository/latest_news_repository.dart';

@injectable
class LatestNewsUseCaseImpl implements UseCase<LatestNewsModel, Params>{
  LatestNewsUseCaseImpl(this.latestNewsRepository);

  final LatestNewsRepository latestNewsRepository;

  @override
  Future<Either<Failure, LatestNewsModel>> call(params) async{
    return await latestNewsRepository.fetchLatestNewsData(params);
  }

}