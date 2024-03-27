import 'package:equatable/equatable.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_data_entity/news_data_entity.dart';

class SearchNewsDataEntity extends Equatable {
  final int id;
  final String status;
  final List<NewsDataEntity> news;
  final int page;
  final String queryString;
  final String saveData;

  const SearchNewsDataEntity({
    this.id = 0,
    this.status = '',
    this.news = const [],
    this.page = 0,
    this.queryString = '',
    this.saveData = '',
  });

  @override
  List<Object?> get props => [
    id,
    status,
    news,
    page,
    queryString,
    saveData,
  ];
}
