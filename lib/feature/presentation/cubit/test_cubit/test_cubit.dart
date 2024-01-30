import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestInitial());

  final myDio = Dio();

  Future<void> myTestCubitMethod() async{ // 'https://www.googleapis.com/youtube/v3/commentThreads?key=AIzaSyAwN8yc4ittxrac_rhW4swd63odvZbHRD8&part=snippet,replies&videoId=De6BAzEQqUo&t'
    final response = await myDio.get(
        'https://www.googleapis.com/youtube/v3/commentThreads?',
      queryParameters: {
          'key':'AIzaSyAwN8yc4ittxrac_rhW4swd63odvZbHRD8',
          'part':'snippet,replies',
          'videoId':'De6BAzEQqUo',
      },
    );
    print(response.data);
  }

}
