import 'package:flutter/material.dart';
import 'package:retrofit_moment/core/assets/my_colors/my_colors.dart';

class MyTextStyles{
  static const TextStyle giantTitleTextStyle = TextStyle(
    fontSize: 40,
  );

  static const TextStyle newsTitleTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
  );

  static const TextStyle authorNewsTextStyle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: MyColors.myGreyColor,
  );

}