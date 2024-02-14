part of 'latest_news_cubit.dart';

abstract class LatestNewsState extends Equatable {
  const LatestNewsState();
}

class LatestNewsStateInitial extends LatestNewsState {
  @override
  List<Object> get props => [];
}

class LatestNewsStateLoading extends LatestNewsState {
  @override
  List<Object> get props => [];
}

class LatestNewsStateLoaded extends LatestNewsState {
  const LatestNewsStateLoaded(this.latestNewsModel);
  final LatestNewsModel latestNewsModel;
  @override
  List<Object> get props => [latestNewsModel];
}

class LatestNewsStateError extends LatestNewsState {
  @override
  List<Object> get props => [];
}
