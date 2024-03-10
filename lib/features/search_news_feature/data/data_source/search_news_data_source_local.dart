import 'package:retrofit_moment/features/search_news_feature/data/search_news_local_drift_database/search_news_local_drift_database.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';

abstract class SearchNewsDataSourceLocal{
  Database getDb();
  Future<void> saveModelToBd(Database database, SearchNewsModel searchNewsModel);
  Future<SearchNewsModel> selectLastModelFromBd(Database database);
  Future<SearchNewsModel> selectPreLastModelFromBd(Database database);

}