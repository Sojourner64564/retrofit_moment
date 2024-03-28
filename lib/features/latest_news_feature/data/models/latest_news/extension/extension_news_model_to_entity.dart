import 'package:retrofit_moment/features/latest_news_feature/data/models/latest_news/news_model.dart';
import 'package:retrofit_moment/features/latest_news_feature/domain/entity/news_entity.dart';

extension NewsToEntetyExtension on NewsModel {
  NewsEntity toEntity(NewsModel newsModel) {
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
//TODO DateFormat("dd-MM-yyyy – kk:mm").format(DateTime.parse(newsModel.published))//newsModel.published, сделать так но потом