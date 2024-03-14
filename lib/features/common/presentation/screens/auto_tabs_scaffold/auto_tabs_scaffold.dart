import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_moment/core/assets/my_colors/my_colors.dart';
import 'package:retrofit_moment/core/route/route.gr.dart';
import 'package:retrofit_moment/generated/locale_keys.g.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

@RoutePage()
class AutoTabsScaffolPage extends StatelessWidget{
  const AutoTabsScaffolPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        const FirstRoute(),
        SecondRoute(),
        const ThirdRoute(),
      ],
      bottomNavigationBuilder: (buildContext, tabsRouter){
        return SalomonBottomBar(
          currentIndex:  tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items:  [
              SalomonBottomBarItem(
                selectedColor: MyColors.myBlackColor,
                  icon: const Icon(Icons.home),
                  title: Text(LocaleKeys.latest_news.tr()),
              ),
            SalomonBottomBarItem(
              selectedColor: MyColors.myBlackColor,
              icon: const Icon(Icons.search),
              title:  Text(LocaleKeys.search_news.tr()),
            ),
            SalomonBottomBarItem(
              selectedColor: MyColors.myBlackColor,
              icon: const Icon(Icons.density_small),
              title: Text(LocaleKeys.saved_news.tr()),
            ),
          ],

        );
      },
    );
  }

}