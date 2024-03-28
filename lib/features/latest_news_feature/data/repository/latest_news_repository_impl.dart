import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/assets/my_env_var_name/my_env_var_name.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/network/network_info.dart';
import 'package:retrofit_moment/features/latest_news_feature/data/data_source/latest_news_data_source_remote.dart';
import 'package:retrofit_moment/features/latest_news_feature/data/models/latest_news/extension/extension_latest_news_model_to_entety.dart';
import 'package:retrofit_moment/features/latest_news_feature/domain/entity/latest_news_entity.dart';
import 'package:retrofit_moment/features/latest_news_feature/domain/repository/latest_news_repository.dart';

@LazySingleton(as: LatestNewsRepository)
class LatestNewsRepositoryImpl implements LatestNewsRepository{
  LatestNewsRepositoryImpl(this.networkInfo, this.latestNewsClientDataSourceRemote);

  final NetworkInfo networkInfo;
  final LatestNewsClientDataSourceRemote latestNewsClientDataSourceRemote;

  @override
  Future<Either<Failure, LatestNewsEntity>> fetchLatestNewsData() async{
    if(await networkInfo.isConnected){
      try{
        final apiKey = dotenv.env[MyEnvVarName.apiKeyNewsService];
        if(apiKey==null) throw ServerFailure();
        final latestNews = await latestNewsClientDataSourceRemote.client().fetchLatestNews(apiKey);
        final answer = latestNews.toEntity();
        return Right(answer);
      }catch(e){
        return Left(ServerFailure());
      }
    }else{
      return Left(ServerFailure());
    }
  }

}