part of 'search_news_cubit.dart';

@immutable
abstract class SearchNewsState {}

class SearchNewsStateInitial extends SearchNewsState {}
class SearchNewsStateLoading extends SearchNewsState {}
class SearchNewsStateLoaded extends SearchNewsState {
  SearchNewsStateLoaded({required this.searchNewsModel});
  final SearchNewsModel searchNewsModel;
}
class SearchNewsStateEmptyList extends SearchNewsState {}
class SearchNewsStateError extends SearchNewsState {}
