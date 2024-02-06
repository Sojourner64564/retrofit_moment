import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/feature/data/data_source/data_source_latest_news/data_source_latest_news.dart';
import 'package:retrofit_moment/feature/data/models/latest_news/latest_news_model.dart';
import 'package:retrofit_moment/feature/data/network/network_info.dart';
import 'package:retrofit_moment/feature/domain/repository/latest_news_repository.dart';
import 'package:retrofit_moment/feature/domain/usecase/params.dart';

@injectable
class LatestNewsRepositoryImpl implements Repository<LatestNewsModel, Params>{
  LatestNewsRepositoryImpl(this.networkInfo, this.dataSourceLatestNews);

  final NetworkInfo networkInfo;
  final DataSourceLatestNews dataSourceLatestNews;

  @override
  Future<Either<Failure, LatestNewsModel>> fetchDataFromSource(Params params) async{
    if(await networkInfo.isConnected){
      final latestNews = await dataSourceLatestNews.fetchLatestNews(params.apiKey);
      return Right(latestNews);
    }else{
      return Left(ServerFailure());
    }
  }

}