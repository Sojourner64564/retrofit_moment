import 'package:equatable/equatable.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_models/news_data_model.dart';

class SearchNewsDataModel extends Equatable{
  const SearchNewsDataModel({
    this.id = 0,
    this.status = '',
    this.news = const [],
    this.page = 0,
    this.queryString = '',
    this.saveData = '',
  });

  final int id;
  final String status;
  final List<NewsDataModel> news;
  final int page;
  final String queryString;
  final String saveData;

  @override
  List<Object?> get props => [id, status, news, page, queryString, saveData];
}