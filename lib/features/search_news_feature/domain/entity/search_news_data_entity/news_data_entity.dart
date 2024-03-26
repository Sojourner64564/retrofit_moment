import 'package:equatable/equatable.dart';

class NewsDataEntity extends Equatable {
  final String newsId;
  final String title;
  final String description;
  final String url;
  final String author;
  final String image;
  final String language;
  final List<String> category;
  final String published;

  const NewsDataEntity({
    this.newsId = '',
    this.title = '',
    this.description = '',
    this.url = '',
    this.author = '',
    this.image = '',
    this.language = '',
    this.category = const [],
    this.published = '',
  });

  @override
  List<Object?> get props => [
    newsId,
    title,
    description,
    url,
    author,
    image,
    language,
    category,
    published,
  ];
}
