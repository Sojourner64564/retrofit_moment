import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_entity/news_entity.dart';

extension NewsToModelExtension on NewsEntity{
  NewsModel toModel(NewsEntity newsEntity){
    return NewsModel(
      id: newsEntity.id,
      title: newsEntity.title,
      description: newsEntity.description,
      url: newsEntity.url,
      author: newsEntity.author,
      image: newsEntity.image,
      language: newsEntity.language,
      category: newsEntity.category,
      published: newsEntity.published,
    );
  }
}