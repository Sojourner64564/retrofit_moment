import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/core/assets/my_colors/my_colors.dart';
import 'package:retrofit_moment/core/error/failure.dart';
import 'package:retrofit_moment/core/injectable/injectable.dart';
import 'package:retrofit_moment/features/search_news_feature/data/data_source/search_news_data_source_local_impl.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';
import 'package:retrofit_moment/features/search_news_feature/data/search_news_local_drift_database/search_news_local_drift_database.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/get_db_search_news_use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/lenght_search_news_use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/lenght_search_news_from_db_params.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/no_params.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/save_model_to_db_params.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/params/select_last_model_from_db_params.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/save_search_news_model_void_use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/domain/usecase/select_search_news_last_model_use_case.dart';
import 'package:retrofit_moment/features/search_news_feature/presentation/cubit/update_search_news_list_cubit/update_search_news_list_cubit.dart';

part 'save_news_to_phone_state.dart';

@lazySingleton
class SaveNewsToPhoneCubit extends Cubit<SaveNewsToPhoneState> {
  SaveNewsToPhoneCubit(
    this.getDbSearchNewsUseCase,
    this.saveSearchNewsModelVoidUseCase,
    this.searchNewsLastModelUseCase,
    this.lenghtSearchNewsUseCase,
  ) : super(SaveNewsToPhoneInitial());

  SearchNewsModel actualSearchNewsModel = SearchNewsModel();
  final UpdateSearchNewsListCubit updateSearchNewsListCubit = getIt();
  final GetDbSearchNewsUseCase getDbSearchNewsUseCase;
  final SaveSearchNewsModelVoidUseCase saveSearchNewsModelVoidUseCase;
  final SelectSearchNewsLastModelUseCase searchNewsLastModelUseCase;
  final LenghtSearchNewsUseCase lenghtSearchNewsUseCase;
  String searchBarString = '';

  Future<void> saveNews(BuildContext context) async {
    final String saveData = DateTime.now().toString().substring(0, 19);
    if (actualSearchNewsModel.news.isNotEmpty) {
      final db = await getDbSearchNewsUseCase.call(NoParams());
      final eitherDbOrFailure = db.fold((l) => l, (r) => r);
      if (eitherDbOrFailure is Failure) {
        if (!context.mounted) return;
        _activateScaMess(context, 'Database error');
        return;
      }
      //final db = searchNewsLocalDriftDatabaseImpl.getDb(); //todo---------------------------------
      if (eitherDbOrFailure is Database) {
        final lenghtOfSearchNewsFromDb = await lenghtSearchNewsUseCase
            .call(LenghtSearchNewsFromDbParams(database: eitherDbOrFailure));
        final eitherLenghtOrFailure =
            lenghtOfSearchNewsFromDb.fold((l) => l, (r) => r);
        if (eitherLenghtOrFailure is Failure) {
          if (!context.mounted) return;
          _activateScaMess(context, 'Database error');
        }
        if (eitherLenghtOrFailure is int) {
          if (eitherLenghtOrFailure == 0) {
            saveSearchNewsModelVoidUseCase.call(SaveModelToDbParams(
                database: eitherDbOrFailure,
                searchNewsModel: actualSearchNewsModel,
                queryString: searchBarString,
                saveData: saveData));

            //searchNewsLocalDriftDatabaseImpl.saveModelToBd(eitherDbOrFailure, actualSearchNewsModel, searchBarString, saveData);//todo---------------------------------
            updateSearchNewsListCubit.updateSearchNewsList();
            //actualSearchNewsModel = SearchNewsModel();
            if (context.mounted) _activateScaMess(context, 'News saved');
          } else if (context.mounted) {
            if (eitherLenghtOrFailure != 0) {
              final lastSearchNewsModel = await searchNewsLastModelUseCase.call(
                  SelectLastModelFromBdParams(database: eitherDbOrFailure));
              final eitherModelOrFailure =
                  lastSearchNewsModel.fold((l) => l, (r) => r);
              if (eitherModelOrFailure is Failure) {
                if (!context.mounted) return;
                _activateScaMess(context, 'Database error');

                return;
              }
              // final lastSearchNewsModel = await searchNewsLocalDriftDatabaseImpl.selectLastModelFromBd(eitherDbOrFailure);//todo---------------------------------
              if (eitherModelOrFailure is SearchNewsModel) {
                ///isEmpty
                if (eitherModelOrFailure.news[0] ==
                    actualSearchNewsModel.news[0]) {
                  if (!context.mounted) return;
                  _activateScaMess(context, 'Already saved');
                }

                ///isEmpty
                if (eitherModelOrFailure.news[0] !=
                    actualSearchNewsModel.news[0]) {
                  saveSearchNewsModelVoidUseCase.call(SaveModelToDbParams(
                      database: eitherDbOrFailure,
                      searchNewsModel: actualSearchNewsModel,
                      queryString: searchBarString,
                      saveData: saveData));
                  /*searchNewsLocalDriftDatabaseImpl.saveModelToBd(
                    eitherDbOrFailure, actualSearchNewsModel, searchBarString, saveData);*/ //todo---------------------------------
                  updateSearchNewsListCubit.updateSearchNewsList();
                  //actualSearchNewsModel = SearchNewsModel();
                  if (!context.mounted) return;
                  _activateScaMess(context, 'News saved');
                }
              }
            }
          }
        }
        //final lenghtOfSearchNewsFromDb = await searchNewsLocalDriftDatabaseImpl.lenghtOfSearchNewsFromDb(eitherDbOrFailure); //todo ------------------
      }
    } else {
      _activateScaMess(context, 'Empty list of news');
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
