import 'package:flutter/material.dart';

class StatePicker {
  static Widget pickStateInitLoadingLoadedError<
  A extends CommonState,
  B extends CommonState,
  C extends CommonState,
  D extends CommonState,
  CommonState>(
      CommonState commonState,
      Widget widgetInit,
      Widget widgetLoading,
      Widget widgetLoaded,
      Widget widgetError,
      Widget widgetUnimplementedError) {
    if (commonState is A) {
      return widgetInit;
    }
    if (commonState is B) {
      return widgetLoading;
    }
    if (commonState is C) {
      return widgetLoaded;
    }
    if (commonState is D) {
      return widgetError;
    } else {
      return widgetUnimplementedError;
    }
  }
}