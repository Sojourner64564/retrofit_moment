import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_models/search_news_data_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/load_search_news_all_news_use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/no_params.dart';

part 'update_search_news_list_state.dart';

@lazySingleton
class UpdateSearchNewsListCubit extends Cubit<UpdateSearchNewsListState> {
  UpdateSearchNewsListCubit(this.loadSearchNewsAllNewsUseCase)
      : super(UpdateSearchNewsListInitialState());
  final LoadSearchNewsAllNewsUseCase loadSearchNewsAllNewsUseCase;

  Future<void> updateSearchNewsList() async {
    emit(UpdateSearchNewsListLoadingState());
    final eitherFailureOrAllNews = await loadSearchNewsAllNewsUseCase.call(NoParams());
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
