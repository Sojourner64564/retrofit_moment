import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_moment/core/assets/my_colors/my_colors.dart';
import 'package:retrofit_moment/core/assets/my_text_styles/my_text_styles.dart';
import 'package:retrofit_moment/core/injectable/injectable.dart';
import 'package:retrofit_moment/features/search_news_feature/presentation/cubit/save_news_to_phone_cubit/save_news_to_phone_cubit.dart';
import 'package:retrofit_moment/features/search_news_feature/presentation/screens/second_screen/second_page.dart';

@RoutePage()
class SecondScreen extends StatelessWidget{
  SecondScreen({super.key});
  SaveNewsToPhoneCubit saveNewsToPhoneCubit = getIt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myWhiteColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
           saveNewsToPhoneCubit.saveNews(context);
           // saveNewsToPhoneCubit.showMessage(context);
           /* ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Nothing to save'),
              ),
            );*/
          }, icon: const Icon(Icons.save_outlined, color: MyColors.myBlackColor),
        ),
        actions: [
          IconButton(
            onPressed: (){

            }, icon: const Icon(Icons.list_outlined, color: MyColors.myBlackColor),
          ),
        ],
        elevation: 0,
        backgroundColor: MyColors.myWhiteColor,
        centerTitle: true,
        title: const Text('Retrofit Moment',
          style: MyTextStyles.appbarTextStyle,
        ),
      ),
      body: SecondPage(),
    );
  }

}