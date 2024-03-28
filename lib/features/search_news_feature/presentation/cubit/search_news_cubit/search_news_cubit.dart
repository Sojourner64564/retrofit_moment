import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/injectable/injectable.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/entity/search_news_entity/search_news_entity.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/search_news_use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/presentation/cubit/save_news_to_phone_cubit/save_news_to_phone_cubit.dart';

part 'search_news_state.dart';

@lazySingleton
class SearchNewsCubit extends Cubit<SearchNewsState> {
  SearchNewsCubit(this.searchNewsUseCase) : super(SearchNewsStateInitial());
  final SearchNewsUseCase searchNewsUseCase;
  final SaveNewsToPhoneCubit saveNewsToPhoneCubit = getIt<SaveNewsToPhoneCubit>();

  Future<void> fetchSearchNews(String searchBarText) async {
    final myText = searchBarText.trim();
    emit(SearchNewsStateLoading());
    final failureOrSearchNewsEither = await searchNewsUseCase.fetchSearchNewsData(keyword: myText);
    final searchNews = failureOrSearchNewsEither.toOption().toNullable();
    if(searchNews == null){
      emit(SearchNewsStateError());
      return;
    }
    if(searchNews.news.isEmpty){
      emit(SearchNewsStateEmptyList());
      return;
    }
    if(searchNews.news.isNotEmpty){
      saveNewsToPhoneCubit.actualSearchNewsEntity = searchNews;
      saveNewsToPhoneCubit.searchBarString = searchBarText;
      emit(SearchNewsStateLoaded(searchNewsEntity: searchNews));
      return;
    }

  }
}
