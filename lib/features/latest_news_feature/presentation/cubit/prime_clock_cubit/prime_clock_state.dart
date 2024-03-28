part of 'prime_clock_cubit.dart';

@immutable
abstract class PrimeClockState {}

class PrimeClockInitialState extends PrimeClockState {}
class PrimeClockLoadingState extends PrimeClockState {}
class PrimeClockLoadedState extends PrimeClockState {
  final String primeTime;
  PrimeClockLoadedState(this.primeTime);
}
