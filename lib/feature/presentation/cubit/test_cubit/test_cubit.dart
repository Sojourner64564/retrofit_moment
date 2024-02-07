import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/feature/data/models/latest_news/latest_news_model.dart';
import 'package:retrofit_moment/feature/domain/usecase/latest_news_use_case.dart';
import 'package:retrofit_moment/feature/domain/usecase/params.dart';
part 'test_state.dart';

@injectable
class TestCubit extends Cubit<TestState> {
  TestCubit(this.latestNewsUseCaseImpl) : super(TestStateInitial());

  final LatestNewsUseCaseImpl latestNewsUseCaseImpl;

  Future<void> myTestCubitMethod() async {
    // 'https://www.googleapis.com/youtube/v3/commentThreads?key=AIzaSyAwN8yc4ittxrac_rhW4swd63odvZbHRD8&part=snippet,replies&videoId=De6BAzEQqUo&t'
    /*   final response = await myDio.get(
        'https://www.googleapis.com/youtube/v3/commentThreads?',
      queryParameters: {
          'key':'AIzaSyAwN8yc4ittxrac_rhW4swd63odvZbHRD8',
          'part':'snippet,replies',
          'videoId':'De6BAzEQqUo',
      },
    );
    print(response.data);*/
    emit(TestStateLoading());
    final failureOrLatestNewsEither = await latestNewsUseCaseImpl.call(Params(apiKey: '0F6ApTX1KpMotLBDoMiIkeBVPdRgdFjw95ITDk_Bt6PY6x_e'));
    final failureOrLatestNews = failureOrLatestNewsEither.fold(
        (failure) => TestStateError(), (latestNews) => latestNews);
    if (failureOrLatestNews is TestStateError) {
      emit(TestStateError());
      throw UnimplementedError();
    }
    emit(TestStateLoaded(failureOrLatestNews as LatestNewsModel));

  }
}
