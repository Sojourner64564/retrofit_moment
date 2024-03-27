part of 'load_search_news_cubit.dart';

@immutable
abstract class LoadSearchNewsState {}

class LoadSearchNewsInitial extends LoadSearchNewsState {}
class LoadSearchNewsLoading extends LoadSearchNewsState {}
class LoadSearchNewsLoaded extends LoadSearchNewsState {
  LoadSearchNewsLoaded({required this.searchNewsEntity});
  final SearchNewsEntity searchNewsEntity;
}
class LoadSearchNewsError extends LoadSearchNewsState {}
