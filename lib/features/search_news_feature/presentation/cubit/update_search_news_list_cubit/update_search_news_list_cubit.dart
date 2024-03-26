import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_models/search_news_data_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/db_search_news_use_case.dart';

part 'update_search_news_list_state.dart';

@lazySingleton
class UpdateSearchNewsListCubit extends Cubit<UpdateSearchNewsListState> {
  UpdateSearchNewsListCubit(this.dbSearchNewsUseCase)
      : super(UpdateSearchNewsListInitialState());
  final DbSearchNewsUseCase dbSearchNewsUseCase;


  Future<void> updateSearchNewsList() async {
    emit(UpdateSearchNewsListLoadingState());
    final eitherFailureOrAllNews = await dbSearchNewsUseCase.loadSearchNewsAllNews();
    final allNews = eitherFailureOrAllNews.toOption().toNullable();
    if (allNews == null) {
      emit(UpdateSearchNewsListErrorState());
      return;
    }
    if (allNews.isEmpty) {
      emit(UpdateSearchNewsListEmptyState());
      return;
    }
    if (allNews.isNotEmpty) {
      emit(UpdateSearchNewsListLoadedState(dataModelList: allNews));
      return;
    }
  }
}
