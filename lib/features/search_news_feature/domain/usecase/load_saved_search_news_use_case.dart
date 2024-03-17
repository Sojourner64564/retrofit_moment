import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/usecase/use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/repository/search_news_repository.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/load_saved_search_news_params.dart';

@injectable
class LoadSavedSearchNewsUseCase implements UseCase<SearchNewsModel, LoadSavedSearchNewsParams>{
  LoadSavedSearchNewsUseCase(this.searchNewsRepository);
  final SearchNewsRepository searchNewsRepository;

  @override
  Future<Either<Failure, SearchNewsModel>> call(LoadSavedSearchNewsParams params) async{
    return await searchNewsRepository.loadSearchNewsByIdModel(params);
  }

}