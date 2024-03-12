import 'package:flutter/material.dart';
import 'package:retrofit_moment/core/assets/my_colors/my_colors.dart';
import 'package:retrofit_moment/core/assets/my_text_styles/my_text_styles.dart';
import 'package:retrofit_moment/features/search_news_feature/presentation/screens/third_screen/widget/saved_search_news_tile_widget.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text(
      'SAVED NEWS',
      style: MyTextStyles.giantTitleTextStyle,
    ),
      const Divider(
        indent: 15,
        endIndent: 15,
        thickness: 3,
        color: MyColors.myBlackColor,
      ),
    Flexible(
      flex: 2,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 32,
        itemBuilder: (BuildContext context, int index) {
          return const SavedSearchNewsTileWidget();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 20);
        },
      ),
    ),
      const Divider(
        indent: 15,
        endIndent: 15,
        thickness: 3,
        color: MyColors.myBlackColor,
      ),
      const SizedBox(height: 10),
      Flexible(
        flex: 10,
        child:
      Container(color: Colors.green,),
      )
    ],
  );
  }
}
