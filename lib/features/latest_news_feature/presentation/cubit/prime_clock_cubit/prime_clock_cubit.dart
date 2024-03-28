import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'prime_clock_state.dart';

@lazySingleton
class PrimeClockCubit extends Cubit<PrimeClockState> {
  PrimeClockCubit() : super(PrimeClockInitialState());

  void getPrimeTime(){
    emit(PrimeClockLoadingState());
    final DateTime dateTimeNow = DateTime.now();
    final dayOfWeek = DateFormat.EEEE('en').format(dateTimeNow);
    final month = DateFormat.MMMd('en').format(dateTimeNow);
    final year = dateTimeNow.year;
    final primeTime = '$dayOfWeek | $month | $year';
    emit(PrimeClockLoadedState(primeTime));
  }
}

