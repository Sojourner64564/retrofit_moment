import 'package:retrofit_moment/features/search_news_feature/data/data_models/search_news/news_data_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_data_entity/news_data_entity.dart';

extension NewsDataToEntityExtension on NewsDataModel{
  NewsDataEntity toEntity(NewsDataModel newsDataModel){
    return NewsDataEntity(
      newsId: newsDataModel.newsId,
      title: newsDataModel.title,
      description: newsDataModel.description,
      url: newsDataModel.url,
      author: newsDataModel.author,
      image: newsDataModel.image,
      language: newsDataModel.language,
      category: newsDataModel.category,
      published: newsDataModel.published,
    );
  }
}