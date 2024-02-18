import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/feature/domain/usecase/params.dart';
import 'package:retrofit_moment/feature/domain/usecase/search_news_use_case.dart';

part 'search_news_state.dart';

@injectable
class SearchNewsCubit extends Cubit<SearchNewsState> {
  SearchNewsCubit(this.searchNewsUseCase) : super(SearchNewsStateInitial());
  final SearchNewsUseCase searchNewsUseCase;

 void fetchSearchNews(String searchBarText) async{
   final myText = searchBarText.trim();
   emit(SearchNewsStateLoading());
   try{
     final failureOrSearchNewsEither = await searchNewsUseCase.call(Params(apiKey: '0F6ApTX1KpMotLBDoMiIkeBVPdRgdFjw95ITDk_Bt6PY6x_e', keywords: myText));
     final failureOrSearchNews = failureOrSearchNewsEither.fold((failure)=> failure, (searchNews)=>searchNews);
     if(failureOrSearchNews is Failure){
       emit(SearchNewsStateError());
       throw UnimplementedError();
     }
     failureOrSearchNews as SearchNewsModel;
     if(failureOrSearchNews.news.isEmpty){
       emit(SearchNewsStateEmptyList());
     }
     if(failureOrSearchNews.news.isNotEmpty){
       emit(SearchNewsStateLoaded(searchNewsModel: failureOrSearchNews));
     }
   }catch(e){
     emit(SearchNewsStateEmptyList());
   }

 }
}
