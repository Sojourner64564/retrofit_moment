import 'package:equatable/equatable.dart';
import 'package:retrofit_moment/features/latest_news_feature/domain/entity/news_entity.dart';

class LatestNewsEntity extends Equatable{
  const LatestNewsEntity({
    this.status = '',
    this.news = const [],
  });

  final String status;
  final List<NewsEntity> news;

  @override
  List<Object?> get props => [status, news];
}
