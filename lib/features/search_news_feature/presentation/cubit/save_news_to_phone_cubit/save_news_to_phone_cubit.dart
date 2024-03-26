import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/assets/my_colors/my_colors.dart';
import 'package:retrofit_moment/core/enums/save_response.dart';
import 'package:retrofit_moment/core/injectable/injectable.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/db_search_news_use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/presentation/cubit/update_search_news_list_cubit/update_search_news_list_cubit.dart';


@lazySingleton
class SaveNewsToPhoneCubit extends Cubit{
  SaveNewsToPhoneCubit(
    this.dbSearchNewsUseCase,
  ) : super(null);

  SearchNewsModel actualSearchNewsModel = SearchNewsModel();
  final UpdateSearchNewsListCubit updateSearchNewsListCubit = getIt<UpdateSearchNewsListCubit>();
  final DbSearchNewsUseCase dbSearchNewsUseCase;
  String searchBarString = '';

  Future<void> saveNews(BuildContext context) async {
    final String saveData = DateFormat.yMMMd().format(DateTime.now());
    //final String saveData = DateTime.now().toString().substring(0,19);//TODO седлать форматирование DateFormat('dd:ff:bb')
    //TODO saveResponse заэмитить
    
    final eitherOrSaveResponse = await dbSearchNewsUseCase.saveSearchNewsModel(
            searchNewsModel: actualSearchNewsModel,
            queryString: searchBarString,
            saveData: saveData
    );
    final saveResponse = eitherOrSaveResponse.toOption().toNullable();
    if(saveResponse == null){
      if (context.mounted) _activateScaMess(context, 'Database error');
      return;
    }
    if(saveResponse == SaveResponse.saved){
      if (context.mounted) _activateScaMess(context, 'News saved');
      updateSearchNewsListCubit.updateSearchNewsList();
      return;
    }
    if(saveResponse == SaveResponse.alreadySaved){
      if (context.mounted) _activateScaMess(context, 'Already saved');
      return;
    }

  }

  void _activateScaMess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: MyColors.myBlackColor,
        content: Text(
          message,
        ),
      ),
    );
  }
}
