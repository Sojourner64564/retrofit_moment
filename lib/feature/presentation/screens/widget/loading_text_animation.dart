import 'package:flutter/material.dart';

class LoadingTextAnimation extends StatefulWidget {
  const LoadingTextAnimation({super.key, required this.textStyle});
  final TextStyle textStyle;

  @override
  State<LoadingTextAnimation> createState() => _LoadingTextAnimationState();
}

class _LoadingTextAnimationState extends State<LoadingTextAnimation> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  String textPlus = '';

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this, lowerBound: 0, upperBound: 3);
    animation = Tween<double>(begin: 0, end: 2).animate(controller)
      ..addListener(() {
        setState(() {
          if(controller.value.round() == 0){
            textPlus = '   ';
          }if(controller.value.round() == 1){
            textPlus = '.  ';
          }if(controller.value.round() == 2){
            textPlus = '.. ';
          }if(controller.value.round() == 3){
            textPlus = '...';
          }
        });
      });
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Loading$textPlus',
    style: widget.textStyle,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

