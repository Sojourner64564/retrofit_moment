import 'package:retrofit_moment/feature/data/models/search_news/news_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_news_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SearchNewsModel {
  SearchNewsModel({
     this.status = '',
     this.news = const [],
     this.page = 0,
  });

  final String status;
  final List<NewsModel> news;
  final int page;

  factory SearchNewsModel.fromJson(Map<String,dynamic> json) => _$SearchNewsModelFromJson(json);

  Map<String,dynamic> toJson() => _$SearchNewsModelToJson(this);
}