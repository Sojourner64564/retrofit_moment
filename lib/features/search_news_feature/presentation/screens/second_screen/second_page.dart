import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit_moment/core/assets/my_colors/my_colors.dart';
import 'package:retrofit_moment/core/assets/my_text_styles/my_text_styles.dart';
import 'package:retrofit_moment/core/injectable/injectable.dart';
import 'package:retrofit_moment/features/common/presentation/screens/widget/loading_text_animation.dart';
import 'package:retrofit_moment/features/search_news_feature/presentation/cubit/search_news_cubit/search_news_cubit.dart';
import 'package:retrofit_moment/features/search_news_feature/presentation/screens/widget/listview_tile_search_news.dart';
import 'package:retrofit_moment/generated/locale_keys.g.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});
  final SearchNewsCubit searchNewsCubit = getIt<SearchNewsCubit>();
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(height: 15),
          const Center(
            child: Text(
              'SEARCH NEWS',//TODO капсом Не пиши ты че додстер, в локализацию
              style: MyTextStyles.giantTitleTextStyle,
            ),
          ),
          const Divider(
            indent: 15,
            endIndent: 15,
            thickness: 3,
            color: MyColors.myBlackColor,
          ),
          const SizedBox(height: 15),
          SearchBar(
            onSubmitted: (text){
              searchNewsCubit.fetchSearchNews(text);
            },
            controller: textEditingController,
            leading: const Icon(Icons.search),
            backgroundColor: MaterialStateProperty.all(MyColors.myBlack12Colors),
            elevation: MaterialStateProperty.all(0),
            hintText: LocaleKeys.find_news_by_keywords.tr(),
            hintStyle: MaterialStateProperty.all(MyTextStyles.mediumThinGreyTextStyle),
            shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            )),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: BlocBuilder<SearchNewsCubit, SearchNewsState>(
              bloc: searchNewsCubit,
              builder: (context, state) {
                if(state is SearchNewsStateInitial){
                  return Center(child: Text(LocaleKeys.enter_request_word.tr(), style: MyTextStyles.mediumThickGreyTextStyle));
                }
                if(state is SearchNewsStateLoading){
                  return const Center(child: LoadingTextAnimation(textStyle: MyTextStyles.mediumThickGreyTextStyle));
                }
                if(state is SearchNewsStateLoaded){
                  return Scrollbar(
                    child: ListView.separated(
                      itemCount: state.searchNewsEntity.news.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListviewTileSearchNews(newsEntity: state.searchNewsEntity.news[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          height: 60,
                          indent: 40,
                          endIndent: 40,
                          thickness: 1,
                          color: MyColors.myBlackColor,
                        );
                      },
                    ),
                  );
                }
                if(state is SearchNewsStateEmptyList){
                  return Center(child: Text(LocaleKeys.not_found_request_word.tr(), style: MyTextStyles.mediumThickGreyTextStyle));
                }
                if(state is SearchNewsStateError){
                  return Center(child: Text(LocaleKeys.error.tr(), style: MyTextStyles.mediumThickGreyTextStyle,));
                } else{
                  return Center(child: Text(LocaleKeys.unknown_error.tr(), style: MyTextStyles.mediumThickGreyTextStyle,));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
