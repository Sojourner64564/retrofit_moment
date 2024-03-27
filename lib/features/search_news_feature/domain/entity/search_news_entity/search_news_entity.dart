import 'package:equatable/equatable.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_entity/news_entity.dart';

class SearchNewsEntity extends Equatable{
  const SearchNewsEntity({
    this.status = '',
    this.news = const [],
    this.page = 0,
  });

  final String status;
  final List<NewsEntity> news;
  final int page;

  @override
  List<Object?> get props => [status, news, page];
}