import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_moment/core/assets/my_colors/my_colors.dart';
import 'package:retrofit_moment/core/assets/my_text_styles/my_text_styles.dart';
import 'package:retrofit_moment/features/presentation/screens/first_screen/first_page.dart';

@RoutePage()
class FirstScreen extends StatelessWidget{
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myWhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.myWhiteColor,
        centerTitle: true,
        title: const Text('Retrofit Moment',
        style: MyTextStyles.appbarTextStyle,
        ),
      ),
      body: const FirstPage(),
    );
  }

}