import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/data/search_news_local_drift_database/search_news_local_drift_database.dart';

class SaveModelToDbParams{
  SaveModelToDbParams({required this.database, required this.searchNewsModel, required this.queryString, required this.saveData});
  final Database database;
  final SearchNewsModel searchNewsModel;
  final String queryString;
  final String saveData;
}