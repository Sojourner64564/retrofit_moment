import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit_moment/core/assets/my_colors/my_colors.dart';
import 'package:retrofit_moment/core/assets/my_text_styles/my_text_styles.dart';
import 'package:retrofit_moment/core/injectable/injectable.dart';
import 'package:retrofit_moment/features/latest_news_feature/presentation/cubit/latest_news_cubit/latest_news_cubit.dart';
import 'package:retrofit_moment/features/latest_news_feature/presentation/cubit/prime_clock_cubit/prime_clock_cubit.dart';
import 'package:retrofit_moment/features/latest_news_feature/presentation/screens/first_screen/widget/listview_tile_latest_news.dart';
import 'package:retrofit_moment/features/common/presentation/screens/widget/loading_text_animation.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final LatestNewsCubit latestNewsCubit = getIt<LatestNewsCubit>();
  final PrimeClockCubit primeClockCubit = getIt<PrimeClockCubit>();

  @override
  void initState() {
    primeClockCubit.getPrimeTime();
    latestNewsCubit.myTestCubitMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        const Center(
            child: Text(
          'LATEST NEWS',
          style: MyTextStyles.giantTitleTextStyle,
        )),
        const SizedBox(height: 5),
        const Divider(
          indent: 15,
          endIndent: 15,
          thickness: 3,
          color: MyColors.myBlackColor,
        ),
        Center(
            child: BlocBuilder<PrimeClockCubit, PrimeClockState>(
          bloc: primeClockCubit,
          builder: (context, state) {
            if (state is PrimeClockInitialState) {
              return const Text('');
            }
            if (state is PrimeClockLoadingState) {
              return const Text('');
            }
            if (state is PrimeClockLoadedState) {
              return Text(state.primeTime);
            }else {
              return const Text('Error');
            }
          },
        )),
        const Divider(
          indent: 15,
          endIndent: 15,
          thickness: 3,
          color: MyColors.myBlackColor,
        ),
        const SizedBox(height: 5),
        Expanded(
          child: BlocBuilder<LatestNewsCubit, LatestNewsState>(
              bloc: latestNewsCubit,
              builder: (context, state) {
                if (state is LatestNewsStateInitial) {
                  return const Center(
                      child: Text(
                    'Latest News',
                    style: MyTextStyles.mediumThickGreyTextStyle,
                  ));
                }
                if (state is LatestNewsStateLoading) {
                  return const Center(
                      child: LoadingTextAnimation(
                          textStyle: MyTextStyles.mediumThickGreyTextStyle));
                }
                if (state is LatestNewsStateLoaded) {
                  return Scrollbar(
                    child: ListView.separated(
                      itemCount: state.latestNewsEntity.news.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListviewTileLatestNews(
                          newsEntity: state.latestNewsEntity.news[index],
                        );
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
                if (state is LatestNewsStateEmptyList) {
                  return const Center(
                      child: Text('Empty Latest News List',
                          style: MyTextStyles.mediumThickGreyTextStyle));
                }
                if (state is LatestNewsStateError) {
                  return const Center(
                      child: Text('Error',
                          style: MyTextStyles.mediumThickGreyTextStyle));
                } else {
                  return const Center(child: Text('Unknown Error'));
                }
              }),
        ),
      ],
    );
  }
}
