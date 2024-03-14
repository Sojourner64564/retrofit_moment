import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/data/search_news_local_drift_database/search_news_local_drift_database.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/get_db_search_news_use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/load_saved_search_news_use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/load_saved_search_news_params.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/no_params.dart';
part 'load_search_news_state.dart';

@lazySingleton
class LoadSearchNewsCubit extends Cubit<LoadSearchNewsState> {
  LoadSearchNewsCubit(this.loadSavedSearchNewsUseCase, this.getDbSearchNewsUseCase) : super(LoadSearchNewsInitial());
  final LoadSavedSearchNewsUseCase loadSavedSearchNewsUseCase;
  final GetDbSearchNewsUseCase getDbSearchNewsUseCase;

  Future<void> loadSearchNews(int id) async{
    emit(LoadSearchNewsLoading());
    final database = await getDbSearchNewsUseCase.call(NoParams());
    final eitherDbOrFailure = database.fold((l) => l, (r) => r);
    if(eitherDbOrFailure is Failure){
      emit(LoadSearchNewsError());
      return;
    }
    if(eitherDbOrFailure is Database){
      final loadNews = await  loadSavedSearchNewsUseCase.call(LoadSavedSearchNewsParams(id: id, database: eitherDbOrFailure));
      final eitherNewsOrFailure = loadNews.fold((l) => l, (r) => r);
      if(eitherNewsOrFailure is Failure){
        emit(LoadSearchNewsError());
        return;
      }
      if(eitherNewsOrFailure is SearchNewsModel){
        emit(LoadSearchNewsLoaded(searchNewsModel: eitherNewsOrFailure));
        return;
      }

    }
  }
}
