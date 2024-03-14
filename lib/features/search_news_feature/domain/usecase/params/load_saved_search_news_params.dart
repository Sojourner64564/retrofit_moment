import 'package:retrofit_moment/features/search_news_feature/data/search_news_local_drift_database/search_news_local_drift_database.dart';

class LoadSavedSearchNewsParams{
  LoadSavedSearchNewsParams({required this.id, required this.database});
  final Database database;
  final int id;
}