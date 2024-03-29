import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit_moment/core/assets/my_colors/my_colors.dart';
import 'package:retrofit_moment/core/assets/my_text_styles/my_text_styles.dart';
import 'package:retrofit_moment/core/injectable/injectable.dart';
import 'package:retrofit_moment/features/common/presentation/screens/widget/loading_text_animation.dart';
import 'package:retrofit_moment/features/search_news_feature/presentation/cubit/load_search_news_cubit/load_search_news_cubit.dart';
import 'package:retrofit_moment/features/search_news_feature/presentation/cubit/update_search_news_list_cubit/update_search_news_list_cubit.dart';
import 'package:retrofit_moment/features/search_news_feature/presentation/screens/widget/listview_tile_search_news.dart';
import 'package:retrofit_moment/features/search_news_feature/presentation/screens/widget/saved_search_news_tile_widget.dart';


class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final UpdateSearchNewsListCubit updateSearchNewsListCubit = getIt<UpdateSearchNewsListCubit>();
  final LoadSearchNewsCubit loadSearchNewsCubit = getIt<LoadSearchNewsCubit>();

  @override
  void initState() {
    updateSearchNewsListCubit.updateSearchNewsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'SAVED NEWS', //TODO В ЛОКАЛИЗАЦИЮ ТЕКСТ
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
          child:
              BlocBuilder<UpdateSearchNewsListCubit, UpdateSearchNewsListState>(
            bloc: updateSearchNewsListCubit,
            builder: (context, state) {
              if (state is UpdateSearchNewsListInitialState) {
                return const Center(
                    child: Text(
                  'Initial', //TODO В ЛОКАЛИЗАЦИЮ ТЕКСТ
                  style: MyTextStyles.mediumThickGreyTextStyle,
                ));
              }
              if (state is UpdateSearchNewsListLoadingState) {
                return const Center(
                    child: Text(
                  'Loading', //TODO В ЛОКАЛИЗАЦИЮ ТЕКСТ
                  style: MyTextStyles.mediumThickGreyTextStyle,
                ));
              }
              if (state is UpdateSearchNewsListLoadedState) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.dataModelList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {//TODO сделать реакцию кнопок
                        loadSearchNewsCubit
                            .loadSearchNews(state.dataModelList[index].id);
                      },
                      child: SavedSearchNewsTileWidget(
                        searchNewsDataEntity: state.dataModelList[index],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 20);
                  },
                );
              }
              if (state is UpdateSearchNewsListEmptyState) {
                return const Center(
                    child: Text(
                  'No saves', //TODO В ЛОКАЛИЗАЦИЮ ТЕКСТ
                  style: MyTextStyles.mediumThickGreyTextStyle,
                ));
              }
              if (state is UpdateSearchNewsListErrorState) {
                return const Center(
                    child: Text(
                  'Error', //TODO В ЛОКАЛИЗАЦИЮ ТЕКСТ
                  style: MyTextStyles.mediumThickGreyTextStyle,
                ));
              } else {
                return const Center(
                    child: Text(
                  'Unknown error', //TODO В ЛОКАЛИЗАЦИЮ ТЕКСТ
                  style: MyTextStyles.mediumThickGreyTextStyle,
                ));
              }
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
          child: BlocBuilder<LoadSearchNewsCubit, LoadSearchNewsState>(
            bloc: loadSearchNewsCubit,
            builder: (context, state) {
              if (state is LoadSearchNewsInitial) {
                return const Center(
                    child: Text(
                  'Choose news', //TODO В ЛОКАЛИЗАЦИЮ ТЕКСТ
                  style: MyTextStyles.mediumThickGreyTextStyle,
                ));
              }
              if (state is LoadSearchNewsLoading) {
                return const Center(
                    child: LoadingTextAnimation(
                        textStyle: MyTextStyles.mediumThickGreyTextStyle));
              }
              if (state is LoadSearchNewsLoaded) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.separated(
                    itemCount: state.searchNewsEntity.news.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListviewTileSearchNews(
                          newsEntity: state.searchNewsEntity.news[index]);
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
              if (state is LoadSearchNewsError) {
                return const Center(
                    child: Text(
                  'Database error', //TODO В ЛОКАЛИЗАЦИЮ ТЕКСТ
                  style: MyTextStyles.mediumThickGreyTextStyle,
                ));
              } else {
                return const Center(
                    child: Text(
                  'Unknown error', //TODO В ЛОКАЛИЗАЦИЮ ТЕКСТ
                  style: MyTextStyles.mediumThickGreyTextStyle,
                ));
              }
            },
          ),
        ),
      ],
    );
  }
} //ListviewTileSearchNews(newsModel: state.searchNewsModel.news[index])

