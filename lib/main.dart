import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_moment/core/injectable/injectable.dart';
import 'package:retrofit_moment/core/route/route.dart';
import 'package:retrofit_moment/localization_wrapper.dart';

///alexander lysyakov stav` const please, or you will be punished
/// --> [const] <--
/// /// --> [const] <--
/// /// /// --> [const] <--

/// TODO:
///  1
///  [lib/features/search_news_feature/presentation/cubit/save_news_to_phone_cubit/save_news_to_phone_cubit.dart]
/// Надо разделить поведение,
/// Кубит который ищет
/// Кубит который сохраняет
/// Кубит который обновляет
/// Не должно быть в принципе в слое presentation логика работы  с дб!!!!
/// раскидать поведение отвественным, ответственные ничего кроме того, что они должны делать - не делают принцип S в solid
///
/// Нахуя тем более это делать все в контроллере, если ты состояния никакие не эмитишь и не отслеживаешь
/// Нигде нету проверок на isEmpty, конструкции такие типа list[0] запрещены в принципе, если ты не проверяешь перед каждой на isEmpty
/// Огроменный свитчкейс каскадный, который не читается, стоит использовать обратные проверки, см. guard
/// В принципе сам код нахуй не читаемый
/// 
/// пример:
/// неправильно
/// if(something) {
/// doSomeOther();
/// }
/// 
/// правильно
/// if(!something) return;
/// doSomeOther();
/// 
/// Don't use 'BuildContext's across async gaps.
/// Чтобы использовать контекст, в асинхронных гапах, перед его использованием необходимо вызвать метод context.mounted
/// 
/// 2
/// [lib/features/search_news_feature/presentation/cubit/save_news_to_phone_cubit/save_news_to_phone_state.dart]
/// бесполезный файл нахуй не нужный
/// 
/// 3.
/// [lib/features/search_news_feature/presentation/cubit/search_news_cubit/search_news_cubit.dart]
/// ТЫ ЧЕ ВООБЩЕ ЕБУ ДАЛ АПИ КЛЮЧИ ХРАНИТЬ ТАКИМ ОБРАЗОМ 
/// Я ТВОЙ РОТ ЕБАЛ ТРУБА ШАТАЛ
/// 
/// В файле лишний try не понятный зачем нужный, у тебя и так обработка ошибок есть Either   !
/// 
/// 
/// 4.
/// [lib/features/search_news_feature/presentation/cubit/search_news_cubit/search_news_state.dart]
/// лишнее состояние empty, можно на loaded написать
/// 
/// 5. 
/// [lib/features/search_news_feature/presentation/cubit/search_news_cubit/search_news_state.dart]
/// не умеешь работать с Either, какого хуя ты делаешь такие проверки 
/// Object response is Database
/// это бред
/// 
/// 6.
/// [lib/features/search_news_feature/presentation/cubit/update_search_news_list_cubit/update_search_news_list_cubit.dart]
/// Сам файл не читаемый, у тебя опять класс делает все подряд кроме того, чем он называется
/// Контроллеры тебе нахуй не нужны, чем ты занимаешься. У тебя состояний не эмитится нихуя особо. 
/// 
/// Эту всю логику что у тебя в контроллерах пишется по факту должна быть в repositories
/// Так как она относится к получению данных, а не управлением их модификацией
/// 
/// В СЛОЕ REPOSITORIES ЗАПРЕЩЕНО ОБРАЩЕНИЯ НАПРЯМУЮ К DATABASE, 
/// ЛЮБЫЕ ВЫЗОВЫ ТОЛЬКО ЧЕРЕЗ USECASES
/// 
/// ОТСУТСТВУЕТ РАЗДЕЛЕНИЕ МЕЖДУ СЛОЯМИ DOMAIN И DATA
/// НЕЛЬЗЯ ОТДАВАТЬ НА СЛОЙ PRESENTATION МОДЕЛИ ИЗ DATA
/// МАППИНГ  В ENTITY ДОЛЖЕН ПРОИСХОДИТЬ В REPOSITORIES_IMPL СЛОЯ DATA
/// Перепройди курс по CA
/// 

/// 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  runApp(const LocalizationWrapper(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: getIt<AppRouter>().config(),
    );
  }
}
//flutter pub run easy_localization:generate -S "assets/translations/" -O "lib/core/easy_localization"
//flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -S "assets/translations"
