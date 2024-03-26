import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/db_search_news_use_case.dart';
part 'load_search_news_state.dart';

@lazySingleton
class LoadSearchNewsCubit extends Cubit<LoadSearchNewsState> {
  LoadSearchNewsCubit(this.dbSearchNewsUseCase) : super(LoadSearchNewsInitial());
  final DbSearchNewsUseCase dbSearchNewsUseCase;

  Future<void> loadSearchNews(int id) async{
    emit(LoadSearchNewsLoading());
   final eitherSearchNewsByIdOrFailure = await dbSearchNewsUseCase.loadSearchNewsByIdModel(id: id);
   final searchNewsById = eitherSearchNewsByIdOrFailure.toOption().toNullable();
   if(searchNewsById == null){
     emit(LoadSearchNewsError());
     return;
   }
    emit(LoadSearchNewsLoaded(searchNewsModel: searchNewsById));

  }
}
