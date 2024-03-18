import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/usecase/use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/repository/search_news_repository.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/lenght_search_news_from_db_params.dart';
/*
@injectable
class LenghtSearchNewsUseCase implements UseCase<int, LenghtSearchNewsFromDbParams>{
  LenghtSearchNewsUseCase(this.searchNewsRepository);
  final SearchNewsRepository searchNewsRepository;

  @override
  Future<Either<Failure, int>> call(LenghtSearchNewsFromDbParams params) async{
    return searchNewsRepository.lenghtSearchNews(params);
  }


}*/