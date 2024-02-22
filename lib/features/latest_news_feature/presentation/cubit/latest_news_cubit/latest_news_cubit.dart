import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/params/params.dart';
import 'package:retrofit_moment/features/latest_news_feature/data/models/latest_news/latest_news_model.dart';
import 'package:retrofit_moment/features/latest_news_feature/domain/usecase/latest_news_use_case.dart';
part 'latest_news_state.dart';

@lazySingleton
class LatestNewsCubit extends Cubit<LatestNewsState> {
  LatestNewsCubit(this.latestNewsUseCaseImpl) : super(LatestNewsStateInitial());

  final LatestNewsUseCaseImpl latestNewsUseCaseImpl;

  Future<void> myTestCubitMethod() async {
    emit(LatestNewsStateLoading());
    try{
      final failureOrLatestNewsEither = await latestNewsUseCaseImpl.call(Params(apiKey: '0F6ApTX1KpMotLBDoMiIkeBVPdRgdFjw95ITDk_Bt6PY6x_e'));
      final failureOrLatestNews = failureOrLatestNewsEither.fold(
              (failure) => LatestNewsStateError(), (latestNews) => latestNews);
      if (failureOrLatestNews is LatestNewsStateError) {
        emit(LatestNewsStateError());
        return;
      }
      failureOrLatestNews as LatestNewsModel;
      if(failureOrLatestNews.news.isEmpty){
        emit(LatestNewsStateEmptyList());
      }
      if(failureOrLatestNews.news.isNotEmpty){
        emit(LatestNewsStateLoaded(failureOrLatestNews));
      }
    }catch(e){
      emit(LatestNewsStateError());
    }

  }
}
