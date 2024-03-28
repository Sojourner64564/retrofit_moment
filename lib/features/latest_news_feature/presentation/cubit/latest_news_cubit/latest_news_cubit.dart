import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/features/latest_news_feature/domain/entity/latest_news_entity.dart';
import 'package:retrofit_moment/features/latest_news_feature/domain/usecase/latest_news_use_case.dart';
part 'latest_news_state.dart';

@lazySingleton
class LatestNewsCubit extends Cubit<LatestNewsState> {
  LatestNewsCubit(this.latestNewsUseCase) : super(LatestNewsStateInitial());

  final LatestNewsUseCase latestNewsUseCase;

  Future<void> myTestCubitMethod() async {
    emit(LatestNewsStateLoading());
    final failureOrLatestNewsEither = await latestNewsUseCase.fetchLatestNewsData();
    final failureOrLatestNews =
        failureOrLatestNewsEither.toOption().toNullable();
    if (failureOrLatestNews == null) {
      emit(LatestNewsStateError());
      return;
    }
    if (failureOrLatestNews.news.isEmpty) {
      emit(LatestNewsStateEmptyList());
    }
    if (failureOrLatestNews.news.isNotEmpty) {
      emit(LatestNewsStateLoaded(failureOrLatestNews));
    }
  }
}
