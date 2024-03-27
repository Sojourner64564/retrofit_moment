import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_entity/news_entity.dart';

extension NewsToEntityExtension on NewsModel{
  NewsEntity toEntity(NewsModel newsModel){
    return NewsEntity(
      id: newsModel.id,
      title: newsModel.title,
      description: newsModel.description,
      url: newsModel.url,
      author: newsModel.author,
      image: newsModel.image,
      language: newsModel.language,
      category: newsModel.category,
      published: newsModel.published,
    );
  }

}