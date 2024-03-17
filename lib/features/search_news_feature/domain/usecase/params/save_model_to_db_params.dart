import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';

class SaveModelToDbParams{
  SaveModelToDbParams({required this.searchNewsModel, required this.queryString, required this.saveData});
  final SearchNewsModel searchNewsModel;
  final String queryString;
  final String saveData;
}