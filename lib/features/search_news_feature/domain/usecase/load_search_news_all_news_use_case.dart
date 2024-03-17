import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/usecase/use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_models/search_news_data_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/repository/search_news_repository.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/load_all_news_params.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/no_params.dart';

@injectable
class LoadSearchNewsAllNewsUseCase implements UseCase<List<SearchNewsDataModel>,NoParams>{
  LoadSearchNewsAllNewsUseCase(this.searchNewsRepository);
  final SearchNewsRepository searchNewsRepository;
  @override
  Future<Either<Failure, List<SearchNewsDataModel>>> call(NoParams noParams) {
    return searchNewsRepository.loadSearchNewsAllNews();
  }

}