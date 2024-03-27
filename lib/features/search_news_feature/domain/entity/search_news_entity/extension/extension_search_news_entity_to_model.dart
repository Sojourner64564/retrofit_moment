import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_entity/extension/extension_news_entity_to_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_entity/search_news_entity.dart';

extension SearchNewsToEntityExtension on SearchNewsEntity{
  SearchNewsModel toModel() {
    return SearchNewsModel(
      status: status,
      news: news.map((e) => e.toModel(e)).toList(),
    );
  }
}