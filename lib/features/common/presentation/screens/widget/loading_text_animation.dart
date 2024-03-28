import 'dart:async';

import 'package:flutter/material.dart';

class LoadingTextAnimation extends StatefulWidget {
  const LoadingTextAnimation({super.key, required this.textStyle});
  final TextStyle textStyle;

  @override
  State<LoadingTextAnimation> createState() => _LoadingTextAnimationState();
}

class _LoadingTextAnimationState extends State<LoadingTextAnimation> with SingleTickerProviderStateMixin {
  String textPlus = '';
  int counter = 0;

  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (!mounted) return;
      setState(() {
        textPlus = '.'*counter;
        counter++;
        if(counter==4){
          counter=0;
        }
      });
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Text('Loading$textPlus',
    style: widget.textStyle,
    );
  }

}

