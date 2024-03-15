import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_models/search_news_data_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/get_db_search_news_use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/lenght_search_news_use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/load_search_news_all_news_use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/lenght_search_news_from_db_params.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/load_all_news_params.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/no_params.dart';

part 'update_search_news_list_state.dart';

@lazySingleton
class UpdateSearchNewsListCubit extends Cubit<UpdateSearchNewsListState> {
  final GetDbSearchNewsUseCase getDbSearchNewsUseCase;
  final LenghtSearchNewsUseCase lenghtSearchNewsUseCase;
  final LoadSearchNewsAllNewsUseCase loadSearchNewsAllNewsUseCase;

  UpdateSearchNewsListCubit(
    this.getDbSearchNewsUseCase,
    this.lenghtSearchNewsUseCase,
    this.loadSearchNewsAllNewsUseCase,
  ) : super(UpdateSearchNewsListInitialState());

  Future<void> updateSearchNewsList() async {
    emit(UpdateSearchNewsListLoadingState());
    
    final db = await getDbSearchNewsUseCase.call(NoParams());
    
    final eitherDbOrFailure = db.toOption().toNullable();

    if (eitherDbOrFailure == null) return; //Вот тут обработать можно ошибку

    final lenghtOfSearchNewsFromDb = await lenghtSearchNewsUseCase
        .call(LenghtSearchNewsFromDbParams(database: eitherDbOrFailure));

    final eitherLenghtOrFailure =
        lenghtOfSearchNewsFromDb.toOption().toNullable();
    if (eitherLenghtOrFailure == null) return; //Вот тут обработать можно ошибку

    final allNewsFromBd = await loadSearchNewsAllNewsUseCase
        .call(LoadAllNewsParams(database: eitherDbOrFailure));

    final eitherAllNewsOrFailure = allNewsFromBd.toOption().toNullable();

    //Вот тут обработать можно ошибку
    if (eitherAllNewsOrFailure == null) return;

    emit(
        UpdateSearchNewsListLoadedState(dataModelList: eitherAllNewsOrFailure));
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
