part of 'test_cubit.dart';

abstract class TestState extends Equatable {
  const TestState();
}

class TestStateInitial extends TestState {
  @override
  List<Object> get props => [];
}

class TestStateLoading extends TestState {
  @override
  List<Object> get props => [];
}

class TestStateLoaded extends TestState {
  const TestStateLoaded(this.latestNewsModel);
  final LatestNewsModel latestNewsModel;
  @override
  List<Object> get props => [latestNewsModel];
}

class TestStateError extends TestState {
  @override
  List<Object> get props => [];
}
