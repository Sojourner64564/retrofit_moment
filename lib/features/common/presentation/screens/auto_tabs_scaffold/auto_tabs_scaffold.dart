import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_moment/core/assets/my_colors/my_colors.dart';
import 'package:retrofit_moment/core/route/route.gr.dart';
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
                  title: const Text('Latest News'),
              ),
            SalomonBottomBarItem(
              selectedColor: MyColors.myBlackColor,
              icon: const Icon(Icons.search),
              title:  const Text('Search News'),
            ),
            SalomonBottomBarItem(
              selectedColor: MyColors.myBlackColor,
              icon: const Icon(Icons.density_small),
              title:  const Text('Saved News'),
            ),
          ],

        );
      },
    );
  }

}