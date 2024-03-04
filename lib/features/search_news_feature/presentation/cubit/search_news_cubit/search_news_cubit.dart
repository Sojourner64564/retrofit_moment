import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/injectable/injectable.dart';
import 'package:retrofit_moment/core/params/params.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/search_news_use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/presentation/cubit/save_news_to_phone_cubit/save_news_to_phone_cubit.dart';

part 'search_news_state.dart';

@lazySingleton
class SearchNewsCubit extends Cubit<SearchNewsState> {
  SearchNewsCubit(this.searchNewsUseCase) : super(SearchNewsStateInitial());
  final SearchNewsUseCase searchNewsUseCase;
  final SaveNewsToPhoneCubit saveNewsToPhoneCubit = getIt();

 void fetchSearchNews(String searchBarText) async{
   final myText = searchBarText.trim();
   emit(SearchNewsStateLoading());
   try{
     final failureOrSearchNewsEither = await searchNewsUseCase.call(Params(apiKey: '0F6ApTX1KpMotLBDoMiIkeBVPdRgdFjw95ITDk_Bt6PY6x_e', keywords: myText));
     final failureOrSearchNews = failureOrSearchNewsEither.fold((failure)=> failure, (searchNews)=>searchNews);
     if(failureOrSearchNews is Failure){
       emit(SearchNewsStateError());
       return;
     }
     if(failureOrSearchNews is SearchNewsModel){
       if(failureOrSearchNews.news.isEmpty){
         emit(SearchNewsStateEmptyList());
       }
     }
     if(failureOrSearchNews is SearchNewsModel){
       if(failureOrSearchNews.news.isNotEmpty){
         saveNewsToPhoneCubit.searchNewsModel = failureOrSearchNews;
         emit(SearchNewsStateLoaded(searchNewsModel: failureOrSearchNews));
       }
     }
   }catch(e){
     emit(SearchNewsStateError());
   }

 }
}
