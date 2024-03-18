import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';
part 'search_news_data_source_remote.g.dart';


@RestApi(baseUrl: 'https://api.currentsapi.services/v1/') //TODO ВЫНЕСТИ В CORE класс ассетов, что то вроде бы LINKS
abstract class SearchNewsDataSourceRemote{
  factory SearchNewsDataSourceRemote(Dio dio) = _SearchNewsDataSourceRemote;

  @GET('search')
  Future<SearchNewsModel> fetchSearchNews(
      @Query('apiKey') String apiKey,
      @Query('keywords') String keywords,
      );
}


@injectable
class SearchNewsClientDataSourceRemote{
  SearchNewsDataSourceRemote client(){
    return _SearchNewsDataSourceRemote(Dio());
  }
}