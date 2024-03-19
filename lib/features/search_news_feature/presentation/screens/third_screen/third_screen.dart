import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_moment/core/assets/my_colors/my_colors.dart';
import 'package:retrofit_moment/core/assets/my_text_styles/my_text_styles.dart';
import 'package:retrofit_moment/core/injectable/injectable.dart';
import 'package:retrofit_moment/features/search_news_feature/presentation/cubit/update_search_news_list_cubit/update_search_news_list_cubit.dart';
import 'package:retrofit_moment/features/search_news_feature/presentation/screens/third_screen/third_page.dart';

@RoutePage()
class ThirdScreen extends StatelessWidget{
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myWhiteColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              final UpdateSearchNewsListCubit updateSearchNewsListCubit = getIt();
              updateSearchNewsListCubit.updateSearchNewsList();
            },
            icon: Icon(Icons.ac_unit_rounded, color: Colors.green,)),
        elevation: 0,
        backgroundColor: MyColors.myWhiteColor,
        centerTitle: true,
        title: const Text('Retrofit Moment', //TODO название чисто для сани покажешь потом работадателю он тоже посмеется
          style: MyTextStyles.appbarTextStyle,
        ),
      ),
      body:ThirdPage(),
    );
  }

}