part of 'update_search_news_list_cubit.dart';

@immutable
abstract class UpdateSearchNewsListState {}

class UpdateSearchNewsListInitialState extends UpdateSearchNewsListState {}
class UpdateSearchNewsListLoadingState extends UpdateSearchNewsListState {}
class UpdateSearchNewsListLoadedState extends UpdateSearchNewsListState {
  UpdateSearchNewsListLoadedState({required this.dataModelList});
  final List<SearchNewsDataEntity> dataModelList;
}
class UpdateSearchNewsListEmptyState extends UpdateSearchNewsListState {}
class UpdateSearchNewsListErrorState extends UpdateSearchNewsListState {}
