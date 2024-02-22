import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit_moment/features/latest_news_feature/data/models/latest_news/news_model.dart';

part 'latest_news_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LatestNewsModel{
  const LatestNewsModel({
    this.status = '',
    this.news = const [],
  });

  final String status;
  final List<NewsModel> news;


factory LatestNewsModel.fromJson(Map<String,dynamic> json) => _$LatestNewsModelFromJson(json);

Map<String, dynamic> toJson() => _$LatestNewsModelToJson(this);
}
