import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit_moment/features/data/models/latest_news/latest_news_model.dart';
import 'package:retrofit_moment/features/data/models/search_news/search_news_model.dart';
part 'data_source_latest_news.g.dart';


@RestApi(baseUrl: 'https://api.currentsapi.services/v1/')
abstract class DataSourceRemouteApi{
  factory DataSourceRemouteApi(Dio dio) = _DataSourceRemouteApi;

  @GET('latest-news')
  Future<LatestNewsModel> fetchLatestNews(
      @Query('apiKey') String apiKey,
      );

  @GET('search')
  Future<SearchNewsModel> fetchSearchNews(
      @Query('apiKey') String apiKey,
      @Query('keywords') String keywords,
      );
}


@injectable
class ClientDataSourceRemouteApi{
  DataSourceRemouteApi client(){
    return _DataSourceRemouteApi(Dio());
  }
}