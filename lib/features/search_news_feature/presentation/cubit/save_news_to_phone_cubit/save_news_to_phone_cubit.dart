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
  SearchNewsModel previousSearchNewsModel = SearchNewsModel();
  SearchNewsModel actualSearchNewsModel = SearchNewsModel();
  SearchNewsDataSourceLocalImpl searchNewsLocalDriftDatabaseImpl = getIt();

  void saveNews(BuildContext context){
    if(actualSearchNewsModel.news.isNotEmpty){
        final db = searchNewsLocalDriftDatabaseImpl.getDb();
        searchNewsLocalDriftDatabaseImpl.saveModelToBd(db, actualSearchNewsModel);
    }
    if(actualSearchNewsModel.news.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: MyColors.myBlackColor,
          content: Text('Empty list of news',),
        ),
      );
    }
  }

  void showMessage(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Nothing to save'),
      ),
    );
  }


}
