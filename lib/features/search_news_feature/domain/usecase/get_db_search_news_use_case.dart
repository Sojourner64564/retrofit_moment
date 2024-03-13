import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/usecase/use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/data/search_news_local_drift_database/search_news_local_drift_database.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/repository/search_news_repository.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/no_params.dart';

@injectable
class GetDbSearchNewsUseCase implements UseCase<Database, NoParams>{
  GetDbSearchNewsUseCase(this.searchNewsRepository);
  final SearchNewsRepository searchNewsRepository;

  @override
  Future<Either<Failure, Database>> call(NoParams params) async{
    return searchNewsRepository.getSearchNewsDb();
  }

}