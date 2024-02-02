import 'package:equatable/equatable.dart';
import 'package:retrofit_moment/feature/domain/entity/latest_news/news_entity.dart';

class LatestNewsEntity extends Equatable{
  final String status;
  final List<NewsEntity> news;

  const LatestNewsEntity({
     this.status = '',
     this.news = const [],
  });

  @override
  List<Object?> get props => [status, news];

}
