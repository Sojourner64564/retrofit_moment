import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit_moment/core/injectable/injectable.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_source/search_news_data_source_local_impl.dart';

part 'update_search_news_list_state.dart';

class UpdateSearchNewsListCubit extends Cubit<UpdateSearchNewsListState> {
  UpdateSearchNewsListCubit() : super(UpdateSearchNewsListInitialState());
  SearchNewsDataSourceLocalImpl searchNewsLocalDriftDatabaseImpl = getIt();


  void updateSearchNewsList() async{
       emit(UpdateSearchNewsListLoadingState());
       final db = searchNewsLocalDriftDatabaseImpl.getDb();
       final lenghtOfSearchNewsFromDb = await searchNewsLocalDriftDatabaseImpl.lenghtOfSearchNewsFromDb(db);
       if(lenghtOfSearchNewsFromDb==0){
         emit(UpdateSearchNewsListEmptyState());
         return;
       }



  }
}
