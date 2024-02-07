import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit_moment/core/assets/my_colors/my_colors.dart';
import 'package:retrofit_moment/core/assets/my_text_styles/my_text_styles.dart';
import 'package:retrofit_moment/core/injectable/injectable.dart';
import 'package:retrofit_moment/feature/presentation/cubit/test_cubit/test_cubit.dart';
import 'package:retrofit_moment/feature/presentation/screens/first_screen/widget/listview_tile_latest_news.dart';

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final TestCubit testCubit = getIt();

  @override
  void initState() {
    testCubit.myTestCubitMethod();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        const Center(child: Text('LATEST NEWS',
        style: MyTextStyles.giantTitleTextStyle,
        )),
        const SizedBox(height: 5),
        const Divider(
          indent: 15,
          endIndent: 15,
          thickness: 3,
        color: MyColors.myBlackColor,
        ),
        const Center(child: Text('среда,октябрь 23,2020',
        )),
        const Divider(
          indent: 15,
          endIndent: 15,
          thickness: 3,
          color: MyColors.myBlackColor,
        ),
        const SizedBox(height: 5),
        Expanded(
          child: BlocBuilder<TestCubit, TestState>(
              bloc: testCubit,
              builder: (context, state) {
                if (state is TestStateInitial) {
                  return const Text('TestInitial');
                }
                if (state is TestStateLoading) {
                  return const Text('TestLoading');
                }
                if (state is TestStateLoaded) {
                  return SizedBox(
                    width: double.infinity,
                    child: ListView.separated(
                      itemCount: state.latestNewsModel.news.length,
                      itemBuilder: (BuildContext context, int index){
                          return ListviewTileLatestNews(newsModel: state.latestNewsModel.news[index],);
                        },
                        separatorBuilder: (BuildContext context, int index){
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
                } else {
                  return const Text('error bruh');
                }
              }),
        ),
      ],
    );
  }
}
