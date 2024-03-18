import 'package:retrofit_moment/features/search_news_feature/data/data_models/search_news_data_model.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';

abstract class SearchNewsDataSourceLocal{
  Future<void> saveModelToBd(SearchNewsModel searchNewsModel, String queryString, String saveData);
  Future<SearchNewsModel> selectLastModelFromBd();
  Future<List<SearchNewsDataModel>> loadAllNews();
  Future<SearchNewsModel> selectSearchNewsModelById(int id);
  Future<String?> selectQueryLastModel();
  //TODO: НЕЛЬЗЯ ПРОСТО ТАК ОТДАВАТЬ РЕСУРС, НУЖНО ОБМЕНИВАТЬСЯ МЕЖДУ СЛОЯМИ ТОЛЬКО МОДЕЛЯМИ ЭНТИТЯМИ И ТАК ДАЛЕЕ
}