import 'package:retrofit_moment/features/latest_news_feature/data/models/latest_news/extension/extension_news_model_to_entity.dart';
import 'package:retrofit_moment/features/latest_news_feature/data/models/latest_news/latest_news_model.dart';
import 'package:retrofit_moment/features/latest_news_feature/domain/entity/latest_news_entity.dart';

extension LatestNewsToEntityExtension on LatestNewsModel{
  LatestNewsEntity toEntity(){
    return LatestNewsEntity(
      status: status,
      news: news.map((e) => e.toEntity(e)).toList(),
    );
  }
}