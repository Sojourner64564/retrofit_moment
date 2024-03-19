import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/assets/my_colors/my_colors.dart';
import 'package:retrofit_moment/core/enums/save_response.dart';
import 'package:retrofit_moment/core/injectable/injectable.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/save_model_to_db_params.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/save_search_news_model_use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/presentation/cubit/update_search_news_list_cubit/update_search_news_list_cubit.dart';

part 'save_news_to_phone_state.dart';

@lazySingleton
class SaveNewsToPhoneCubit extends Cubit<SaveNewsToPhoneState> {
  SaveNewsToPhoneCubit(
    this.saveSearchNewsModelUseCase,
  ) : super(SaveNewsToPhoneInitial());

  SearchNewsModel actualSearchNewsModel = const SearchNewsModel();
  final UpdateSearchNewsListCubit updateSearchNewsListCubit = getIt();
  final SaveSearchNewsModelUseCase saveSearchNewsModelUseCase;
  String searchBarString = '';

  Future<void> saveNews(BuildContext context) async {
    final String saveData = DateTime.now().toString().substring(0,19);
    final eitherOrSaveResponse = await saveSearchNewsModelUseCase.call(
        SaveModelToDbParams(
            searchNewsModel: actualSearchNewsModel,
            queryString: searchBarString,
            saveData: saveData)
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
