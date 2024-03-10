import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NewsModel extends Equatable{
  final String id;
  final String title;
  final String description;
  final String url;
  final String author;
  final String image;
  final String language;
  final List<String> category;
  final String published;

  NewsModel({
     this.id = '',
     this.title = '',
     this.description = '',
     this.url = '',
     this.author = '',
     this.image = '',
     this.language = '',
     this.category = const [],
     this.published = '',
  });

  factory NewsModel.fromJson(Map<String,dynamic> json) => _$NewsModelFromJson(json);

  Map<String,dynamic> toJson() => _$NewsModelToJson(this);

  @override
  List<Object?> get props => [id, title, description, url, author, image, language, category, published];
}
