import 'package:retrofit_moment/features/search_news_feature/data/data_models/search_news/extension/extension_news_data_model_to_entity.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_models/search_news/search_news_data_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_data_entity/search_news_data_entity.dart';

extension SearchNewsDataToEntityExtension on SearchNewsDataModel {
  SearchNewsDataEntity toEntity() {
    return SearchNewsDataEntity(
      id: id,
      status: status,
      news: news.map((e) => e.toEntity(e)).toList(),
      page: page,
      queryString: queryString,
      saveData: saveData,
    );
  }
}
