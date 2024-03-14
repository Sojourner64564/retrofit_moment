// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "latest_news": "Latest News",
  "search_news": "Search News",
  "saved_news": "Saved News",
  "find_news_by_keywords": "find news by keywords",
  "enter_request_word": "Enter request word",
  "not_found_request_word": "Not found request word",
  "error": "Error",
  "unknown_error": "Unknown error"
};
static const Map<String,dynamic> ru = {
  "latest_news": "Последние Новости",
  "search_news": "Поиск Новостей",
  "saved_news": "Сохраненный Новости",
  "find_news_by_keywords": "найти новости по ключевым словам",
  "enter_request_word": "Введите искомое слово",
  "not_found_request_word": "Не найдено новостей по ключевому слову",
  "error": "Ошибка",
  "unknown_error": "Неизвестная ошибка"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru};
}
