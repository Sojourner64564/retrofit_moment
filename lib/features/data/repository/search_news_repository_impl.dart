import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/features/data/data_source/data_source_latest_news/data_source_latest_news.dart';
import 'package:retrofit_moment/features/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/features/data/network/network_info.dart';
import 'package:retrofit_moment/core/params/params.dart';
import 'package:retrofit_moment/features/domain/repository/search_news_repository.dart';

@LazySingleton(as: SearchNewsRepository)
class SearchNewsRepositoryImpl implements SearchNewsRepository{
  SearchNewsRepositoryImpl(this.networkInfo, this.clientDataSourceRemouteApi);

  final NetworkInfo networkInfo;
  final ClientDataSourceRemouteApi clientDataSourceRemouteApi;

  @override
  Future<Either<Failure, SearchNewsModel>> fetchSearchNewsData(Params params) async{
    if(await networkInfo.isConnected){
      final searchNews = await clientDataSourceRemouteApi.client().fetchSearchNews(params.apiKey, params.keywords);
      return Right(searchNews);
    }else{
      return Left(ServerFailure());
    }
  }

}