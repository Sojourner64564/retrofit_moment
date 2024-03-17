import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/enums/save_response.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/usecase/use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/repository/search_news_repository.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/save_model_to_db_params.dart';

@injectable
class SaveSearchNewsModelUseCase implements UseCase<SaveResponse ,SaveModelToDbParams>{
  SaveSearchNewsModelUseCase(this.searchNewsRepository);
  final SearchNewsRepository searchNewsRepository;

  @override
  Future<Either<Failure, SaveResponse>> call(SaveModelToDbParams params) async{
    return await searchNewsRepository.saveSearchNewsModel(params);
  }
}