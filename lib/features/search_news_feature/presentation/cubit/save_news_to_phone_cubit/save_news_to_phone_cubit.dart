import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/assets/my_colors/my_colors.dart';
import 'package:retrofit_moment/core/injectable/injectable.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_source/search_news_data_source_local_impl.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';

part 'save_news_to_phone_state.dart';

@lazySingleton
class SaveNewsToPhoneCubit extends Cubit<SaveNewsToPhoneState> {
  SaveNewsToPhoneCubit() : super(SaveNewsToPhoneInitial());
  SearchNewsModel actualSearchNewsModel = SearchNewsModel();
  SearchNewsDataSourceLocalImpl searchNewsLocalDriftDatabaseImpl = getIt();

  void saveNews(BuildContext context) async {
    if (actualSearchNewsModel.news.isNotEmpty) {
      final db = searchNewsLocalDriftDatabaseImpl.getDb();
      final lenghtOfSearchNewsFromDb = await searchNewsLocalDriftDatabaseImpl.lenghtOfSearchNewsFromDb(db);

      if(lenghtOfSearchNewsFromDb==0){
        searchNewsLocalDriftDatabaseImpl.saveModelToBd(db, actualSearchNewsModel);
      }else if (context.mounted){
        if(lenghtOfSearchNewsFromDb!=0) {
          final lastSearhNewsModel = await searchNewsLocalDriftDatabaseImpl.selectLastModelFromBd(db);
          if (lastSearhNewsModel.news[0] == actualSearchNewsModel.news[0]) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: MyColors.myBlackColor,
                content: Text(
                  'Already saved',
                ),
              ),
            );
          }
          if (lastSearhNewsModel.news[0] != actualSearchNewsModel.news[0]) {
            searchNewsLocalDriftDatabaseImpl.saveModelToBd(
                db, actualSearchNewsModel);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: MyColors.myBlackColor,
                content: Text(
                  'News just got saved',
                ),
              ),
            );
          }
        }
      }
    }

    if (actualSearchNewsModel.news.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: MyColors.myBlackColor,
          content: Text(
            'Empty list of news',
          ),
        ),
      );
    }
  }


}
