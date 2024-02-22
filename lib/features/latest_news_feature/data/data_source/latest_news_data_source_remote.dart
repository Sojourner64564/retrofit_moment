import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit_moment/features/latest_news_feature/data/models/latest_news/latest_news_model.dart';
part 'latest_news_data_source_remote.g.dart';


@RestApi(baseUrl: 'https://api.currentsapi.services/v1/')
abstract class LatestNewsDataSourceRemote{
  factory LatestNewsDataSourceRemote(Dio dio) = _LatestNewsDataSourceRemote;

  @GET('latest-news')
  Future<LatestNewsModel> fetchLatestNews(
      @Query('apiKey') String apiKey,
      );
}


@injectable
class LatestNewsClientDataSourceRemote{
  LatestNewsDataSourceRemote client(){
    return _LatestNewsDataSourceRemote(Dio());
  }
}