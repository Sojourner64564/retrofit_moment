import 'package:retrofit_moment/features/search_news_feature/data/search_news_local_drift_database/search_news_local_drift_database.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';

abstract class SearchNewsDataSourceLocal{
  Database getDb();
  Future<void> saveModelToBd(Database database, SearchNewsModel searchNewsModel, String queryString, String saveData);
  Future<SearchNewsModel> selectLastModelFromBd(Database database);
  Future<int> lenghtOfSearchNewsFromDb(Database database);
  Future<List<SearchNews>> loadAllNews(Database database);
}