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

  static const TextStyle appbarTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: MyColors.myBlackColor,
  );
  static const TextStyle mediumNewsTitleTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
  );
  static const TextStyle mediumThickGreyTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: MyColors.myGreyColor,
  );
  static const TextStyle mediumThinGreyTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: MyColors.myGreyColor,
  );
  static const TextStyle mediumThickBlackTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: MyColors.myBlackColor,
  );
  static const TextStyle mediumThickWhiteTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: MyColors.myWhiteColor,
  );
  static const TextStyle littleThickBlackTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: MyColors.myBlackColor,
  );
  static const TextStyle littleThickWhiteTextStyle = TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w700,
    color: MyColors.myWhiteColor,
  );
}