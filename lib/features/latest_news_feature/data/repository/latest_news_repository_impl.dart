import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/network/network_info.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/params.dart';
import 'package:retrofit_moment/features/latest_news_feature/data/data_source/latest_news_data_source_remote.dart';
import 'package:retrofit_moment/features/latest_news_feature/data/models/latest_news/latest_news_model.dart';
import 'package:retrofit_moment/features/latest_news_feature/domain/repository/latest_news_repository.dart';

@LazySingleton(as: LatestNewsRepository)
class LatestNewsRepositoryImpl implements LatestNewsRepository{
  LatestNewsRepositoryImpl(this.networkInfo, this.latestNewsClientDataSourceRemote);

  final NetworkInfo networkInfo;
  final LatestNewsClientDataSourceRemote latestNewsClientDataSourceRemote;

  @override
  Future<Either<Failure, LatestNewsModel>> fetchLatestNewsData(Params params) async{
    if(await networkInfo.isConnected){
      try{
        final latestNews = await latestNewsClientDataSourceRemote.client().fetchLatestNews(params.apiKey);
        return Right(latestNews);
      }catch(e){
        return Left(ServerFailure());
      }
    }else{
      return Left(ServerFailure());
    }
  }

}