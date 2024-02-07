import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/usecase/use_case.dart';
import 'package:retrofit_moment/feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/feature/data/repository/search_news_repository_impl.dart';
import 'package:retrofit_moment/feature/domain/usecase/params.dart';

@injectable
class SearchNewsUseCase implements UseCase<SearchNewsModel, Params>{
  SearchNewsUseCase(this.searchNewsRepositoryImpl);

  final SearchNewsRepositoryImpl searchNewsRepositoryImpl;

  @override
  Future<Either<Failure, SearchNewsModel>> call(Params params) async{
    return await searchNewsRepositoryImpl.fetchDataFromSource(params);
  }
}