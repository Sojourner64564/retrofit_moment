part of 'test_cubit.dart';

abstract class TestState extends Equatable {
  const TestState();
}

class TestInitial extends TestState {
  @override
  List<Object> get props => [];
}
class TestLoading extends TestState {
  @override
  List<Object> get props => [];
}
class TestLoaded extends TestState {
  @override
  List<Object> get props => [];
}
class TestError extends TestState {
  @override
  List<Object> get props => [];
}
