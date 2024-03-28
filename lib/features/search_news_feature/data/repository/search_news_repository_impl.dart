import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/network/network_info.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_source/search_news_data_source_remote.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/extension/extension_search_news_model_to_entity.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_entity/search_news_entity.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/repository/search_news_repository.dart';

@LazySingleton(as: SearchNewsRepository)
class SearchNewsRepositoryImpl implements SearchNewsRepository {
  SearchNewsRepositoryImpl(
      this.networkInfo,
      this.searchNewsClientDataSourceRemote,
      );

  final NetworkInfo networkInfo;
  final SearchNewsClientDataSourceRemote searchNewsClientDataSourceRemote;

  @override
  Future<Either<Failure, SearchNewsEntity>> fetchSearchNewsData({
   required String keyword
  }) async {
    if (await networkInfo.isConnected) {
      try{
        final apiKey = dotenv.env['API_KEY_NEWS_SERVICE'];
        if(apiKey==null) throw ServerFailure();
        final searchNews = await searchNewsClientDataSourceRemote
            .client()
            .fetchSearchNews(apiKey, keyword);
        final answer = searchNews.toEntity();
        return Right(answer);
      }catch(e){
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }


}
