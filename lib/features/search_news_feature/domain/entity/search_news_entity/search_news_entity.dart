import 'package:equatable/equatable.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/news_model.dart';

class SearchNewsModel extends Equatable{
  const SearchNewsModel({
    this.status = '',
    this.news = const [],
    this.page = 0,
  });

  final String status;
  final List<NewsModel> news;
  final int page;

  @override
  List<Object?> get props => [status, news, page];
}