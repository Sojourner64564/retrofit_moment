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
   print(myText);
   emit(SearchNewsStateLoading());
   final failureOrSearchNewsEither = await searchNewsUseCase.call(Params(apiKey: '0F6ApTX1KpMotLBDoMiIkeBVPdRgdFjw95ITDk_Bt6PY6x_e', keywords: myText));
   final failureOrSearchNews = failureOrSearchNewsEither.fold((failure)=> failure, (searchNews)=>searchNews);
   if(failureOrSearchNews is Failure){
     emit(SearchNewsStateError());
     throw UnimplementedError();
   }
   print((failureOrSearchNews as SearchNewsModel).news.length);
   emit(SearchNewsStateLoaded(searchNewsModel: failureOrSearchNews as SearchNewsModel));
 }
}
