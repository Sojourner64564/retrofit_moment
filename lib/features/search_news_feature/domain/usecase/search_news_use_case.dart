import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/usecase/use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/params.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/repository/search_news_repository.dart';

@injectable
class SearchNewsUseCase implements UseCase<SearchNewsModel, Params>{
  SearchNewsUseCase(this.searchNewsRepository);

  final SearchNewsRepository searchNewsRepository;

  @override
  Future<Either<Failure, SearchNewsModel>> call(Params params) async{
    return await searchNewsRepository.fetchSearchNewsData(params);
  }
}