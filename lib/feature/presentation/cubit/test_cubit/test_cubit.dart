import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/feature/data/data_source/data_source_latest_news/data_source_latest_news.dart';
import 'package:retrofit_moment/feature/domain/usecase/latest_news_use_case.dart';

part 'test_state.dart';

@injectable
class TestCubit extends Cubit<TestState> {
  TestCubit(this.latestNewsUseCaseImpl) : super(TestInitial());

  final LatestNewsUseCaseImpl latestNewsUseCaseImpl;
  final myDio = Dio();

  Future<void> myTestCubitMethod() async{ // 'https://www.googleapis.com/youtube/v3/commentThreads?key=AIzaSyAwN8yc4ittxrac_rhW4swd63odvZbHRD8&part=snippet,replies&videoId=De6BAzEQqUo&t'
 /*   final response = await myDio.get(
        'https://www.googleapis.com/youtube/v3/commentThreads?',
      queryParameters: {
          'key':'AIzaSyAwN8yc4ittxrac_rhW4swd63odvZbHRD8',
          'part':'snippet,replies',
          'videoId':'De6BAzEQqUo',
      },
    );
    print(response.data);*/

    final dataSourceLatestNews = DataSourceLatestNews(Dio());
    final response = await dataSourceLatestNews.fetchLatestNews('0F6ApTX1KpMotLBDoMiIkeBVPdRgdFjw95ITDk_Bt6PY6x_e');
    print(response.news);
  }

}
