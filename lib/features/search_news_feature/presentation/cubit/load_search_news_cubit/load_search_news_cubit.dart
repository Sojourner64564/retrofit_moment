import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/load_saved_search_news_use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/load_saved_search_news_params.dart';
part 'load_search_news_state.dart';

@lazySingleton
class LoadSearchNewsCubit extends Cubit<LoadSearchNewsState> {
  LoadSearchNewsCubit(this.loadSavedSearchNewsUseCase) : super(LoadSearchNewsInitial());
  final LoadSavedSearchNewsUseCase loadSavedSearchNewsUseCase;

  Future<void> loadSearchNews(int id) async{
    emit(LoadSearchNewsLoading());
   final eitherSearchNewsByIdOrFailure = await loadSavedSearchNewsUseCase.call(LoadSavedSearchNewsParams(id: id));
   final searchNewsById = eitherSearchNewsByIdOrFailure.toOption().toNullable();
   if(searchNewsById == null){
     emit(LoadSearchNewsError());
     return;
   }
    emit(LoadSearchNewsLoaded(searchNewsModel: searchNewsById));

   /* if(eitherDbOrFailure is Database){
      final loadNews = await  loadSavedSearchNewsUseCase.call(LoadSavedSearchNewsParams(id: id));
      final eitherNewsOrFailure = loadNews.fold((l) => l, (r) => r);
      if(eitherNewsOrFailure is Failure){
        emit(LoadSearchNewsError());
        return;
      }
      if(eitherNewsOrFailure is SearchNewsModel){
        emit(LoadSearchNewsLoaded(searchNewsModel: eitherNewsOrFailure));
        return;
      }

    }*/
  }
}
