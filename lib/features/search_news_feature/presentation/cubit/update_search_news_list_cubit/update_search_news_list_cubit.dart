import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/injectable/injectable.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_models/search_news_data_model.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_source/search_news_data_source_local.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_source/search_news_data_source_local_impl.dart';
import 'package:retrofit_moment/features/search_news_feature/data/search_news_local_drift_database/search_news_local_drift_database.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/get_db_search_news_use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/lenght_search_news_use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/load_search_news_all_news_use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/lenght_search_news_from_db_params.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/load_all_news_params.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/no_params.dart';

part 'update_search_news_list_state.dart';

@lazySingleton
class UpdateSearchNewsListCubit extends Cubit<UpdateSearchNewsListState> {
  UpdateSearchNewsListCubit(this.getDbSearchNewsUseCase, this.lenghtSearchNewsUseCase, this.loadSearchNewsAllNewsUseCase) : super(UpdateSearchNewsListInitialState());
  final GetDbSearchNewsUseCase getDbSearchNewsUseCase;
  final LenghtSearchNewsUseCase lenghtSearchNewsUseCase;
  final LoadSearchNewsAllNewsUseCase loadSearchNewsAllNewsUseCase;

  Future<void> updateSearchNewsList() async{
       emit(UpdateSearchNewsListLoadingState());
       final db = await getDbSearchNewsUseCase.call(NoParams());
       final eitherDbOrFailure = db.fold((l) => l, (r) => r);
       if(eitherDbOrFailure is Failure){
         return;
       }
       if(eitherDbOrFailure is Database){
         final lenghtOfSearchNewsFromDb = await lenghtSearchNewsUseCase.call(LenghtSearchNewsFromDbParams(database: eitherDbOrFailure));
         final eitherLenghtOrFailure = lenghtOfSearchNewsFromDb.fold((l) => l, (r) => r);
         if(eitherLenghtOrFailure is Failure){
           emit(UpdateSearchNewsListErrorState());
           return;}
         if(eitherLenghtOrFailure is int){
           if(eitherLenghtOrFailure==0){
             emit(UpdateSearchNewsListEmptyState());
             return;}
           final allNewsFromBd = await loadSearchNewsAllNewsUseCase.call(LoadAllNewsParams(database: eitherDbOrFailure));
           final eitherAllNewsOrFailure = allNewsFromBd.fold((l) => l, (r) => r);
           if(eitherAllNewsOrFailure is Failure){
             emit(UpdateSearchNewsListErrorState());
             return;
           }
           if(eitherAllNewsOrFailure is List<SearchNewsDataModel>){
             emit(UpdateSearchNewsListLoadedState(dataModelList: eitherAllNewsOrFailure));
           }
         }
         }
       }
       //final db = searchNewsLocalDriftDatabaseImpl.getDb();
       /*final lenghtOfSearchNewsFromDb = await searchNewsLocalDriftDatabaseImpl.lenghtOfSearchNewsFromDb(db);
       if(lenghtOfSearchNewsFromDb==0){
         emit(UpdateSearchNewsListEmptyState());
         return;
       }
       final allNews = await searchNewsLocalDriftDatabaseImpl.loadAllNews(db);
       emit(UpdateSearchNewsListLoadedState(dataModelList: allNews));
*/
  }

