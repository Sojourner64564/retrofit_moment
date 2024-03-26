import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable{
  const NewsEntity({
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

  final String id;
  final String title;
  final String description;
  final String url;
  final String author;
  final String image;
  final String language;
  final List<String> category;
  final String published;

  @override
  List<Object?> get props => [id, title, description, url, author, image, language, category, published];



}