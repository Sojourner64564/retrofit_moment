import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/extension/extension_news_model_to_entity.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_entity/search_news_entity.dart';

extension SearchNewsToEntityExtension on SearchNewsModel{
  SearchNewsEntity toEntity(){
    return SearchNewsEntity(
      status: status,
      news: news.map((e) => e.toEntity(e)).toList(),
    );
  }

}

