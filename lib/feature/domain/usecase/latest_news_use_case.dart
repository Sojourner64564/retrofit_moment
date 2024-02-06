import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/usecase/use_case.dart';
import 'package:retrofit_moment/feature/data/models/latest_news/latest_news_model.dart';
import 'package:retrofit_moment/feature/data/repository/latest_news_repository_impl.dart';
import 'package:retrofit_moment/feature/domain/usecase/params.dart';

@injectable
class LatestNewsUseCaseImpl implements UseCase<LatestNewsModel, Params>{
  LatestNewsUseCaseImpl(this.latestNewsRepositoryImpl);

  final LatestNewsRepositoryImpl latestNewsRepositoryImpl;

  @override
  Future<Either<Failure, LatestNewsModel>> call(params) async{
    return await latestNewsRepositoryImpl.fetchDataFromSource(params);
  }

}