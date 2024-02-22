import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/network/network_info.dart';
import 'package:retrofit_moment/core/params/params.dart';
import 'package:retrofit_moment/features/latest_news_feature/data/data_source/latest_news_data_source_remote.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_source/search_news_data_source_remote.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/repository/search_news_repository.dart';

@LazySingleton(as: SearchNewsRepository)
class SearchNewsRepositoryImpl implements SearchNewsRepository{
  SearchNewsRepositoryImpl(this.networkInfo, this.searchNewsClientDataSourceRemote);

  final NetworkInfo networkInfo;
  final SearchNewsClientDataSourceRemote searchNewsClientDataSourceRemote;

  @override
  Future<Either<Failure, SearchNewsModel>> fetchSearchNewsData(Params params) async{
    if(await networkInfo.isConnected){
      final searchNews = await searchNewsClientDataSourceRemote.client().fetchSearchNews(params.apiKey, params.keywords);
      return Right(searchNews);
    }else{
      return Left(ServerFailure());
    }
  }

}