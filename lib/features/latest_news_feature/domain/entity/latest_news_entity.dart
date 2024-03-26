import 'package:equatable/equatable.dart';
import 'package:retrofit_moment/features/latest_news_feature/domain/entity/news_entity.dart';

class LatestNewsModel extends Equatable{
  const LatestNewsModel({
    this.status = '',
    this.news = const [],
  });

  final String status;
  final List<NewsEntity> news;

  @override
  List<Object?> get props => [status, news];

}
