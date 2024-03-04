import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit_moment/features/search_news_feature/data/models/search_news/search_news_model.dart';
import 'package:sqflite/sqflite.dart';

part 'save_news_to_phone_state.dart';

@lazySingleton
class SaveNewsToPhoneCubit extends Cubit<SaveNewsToPhoneState> {
  SaveNewsToPhoneCubit() : super(SaveNewsToPhoneInitial());
  SearchNewsModel searchNewsModel = SearchNewsModel();

  void saveNews(){

  }

}
