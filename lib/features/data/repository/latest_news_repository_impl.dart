import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/params/params.dart';
import 'package:retrofit_moment/features/data/data_source/data_source_latest_news/data_source_latest_news.dart';
import 'package:retrofit_moment/features/data/models/latest_news/latest_news_model.dart';
import 'package:retrofit_moment/features/data/network/network_info.dart';
import 'package:retrofit_moment/features/domain/repository/latest_news_repository.dart';

@LazySingleton(as: LatestNewsRepository)
class LatestNewsRepositoryImpl implements LatestNewsRepository{
  LatestNewsRepositoryImpl(this.networkInfo, this.clientDataSourceRemouteApi);

  final NetworkInfo networkInfo;
  final ClientDataSourceRemouteApi clientDataSourceRemouteApi;

  @override
  Future<Either<Failure, LatestNewsModel>> fetchLatestNewsData(Params params) async{
    if(await networkInfo.isConnected){
      final latestNews = await clientDataSourceRemouteApi.client().fetchLatestNews(params.apiKey);
      return Right(latestNews);
    }else{
      return Left(ServerFailure());
    }
  }

}