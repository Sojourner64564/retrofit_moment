import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit_moment/feature/data/models/latest_news/latest_news_model.dart';
part 'data_source_latest_news.g.dart';


@RestApi(baseUrl: 'https://api.currentsapi.services/v1/')
abstract class DataSourceLatestNews{
  factory DataSourceLatestNews(Dio dio) = _DataSourceLatestNews;

  @GET('latest-news')
  Future<LatestNewsModel> fetchLatestNews(
      @Query('apiKey') String apiKey,
      );
}

@module
abstract class DataSourceLatestNewsModule {
  _DataSourceLatestNews get dataSourceLatestNews => _DataSourceLatestNews(Dio());
}

/*
@module
abstract class RegisterModuleConnectionChecker{
  InternetConnectionChecker get internetConnection => InternetConnectionChecker();
}*/