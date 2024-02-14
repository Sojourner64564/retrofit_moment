import 'package:flutter/material.dart';

class LoadingTextAnimation extends AnimatedWidget {
  LoadingTextAnimation({required super.listenable});


  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    print(animation.value);
    //if(animation.value)
    return Text('Loading...');
  }

}

