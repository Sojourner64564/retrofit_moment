import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/usecase/void_use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/repository/search_news_repository.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/save_model_to_db_params.dart';

@injectable
class SaveSearchNewsModelVoidUseCase implements VoidUseCase<SaveModelToDbParams>{
  SaveSearchNewsModelVoidUseCase(this.searchNewsRepository);
  final SearchNewsRepository searchNewsRepository;

  @override
  Future<void> call(SaveModelToDbParams params) async{
    return await searchNewsRepository.saveSearchNewsModel(params);
  }
}