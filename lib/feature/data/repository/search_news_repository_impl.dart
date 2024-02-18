import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/feature/data/data_source/data_source_latest_news/data_source_latest_news.dart';
import 'package:retrofit_moment/feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/feature/data/network/network_info.dart';
import 'package:retrofit_moment/feature/domain/repository/repository.dart';
import 'package:retrofit_moment/feature/domain/usecase/params.dart';

@injectable
class SearchNewsRepositoryImpl implements Repository<SearchNewsModel, Params>{
  SearchNewsRepositoryImpl(this.networkInfo, this.clientDataSourceRemouteApi);

  final NetworkInfo networkInfo;
  final ClientDataSourceRemouteApi clientDataSourceRemouteApi;

  @override
  Future<Either<Failure, SearchNewsModel>> fetchDataFromSource(Params params) async{
    if(await networkInfo.isConnected){
      final searchNews = await clientDataSourceRemouteApi.client().fetchSearchNews(params.apiKey, params.keywords);
      return Right(searchNews);
    }else{
      return Left(ServerFailure());
    }
  }

}