import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retrofit_moment/core/assets/my_links/my_links.dart';
import 'package:retrofit_moment/core/easy_localization/codegen_loader.g.dart';
import 'package:retrofit_moment/core/injectable/injectable.dart';
import 'package:retrofit_moment/core/route/route.dart';
import 'package:retrofit_moment/localization_wrapper.dart';

//TODO РАЗДЕЛИТЬ ВЕРСТКУ ПО БЛОКАМ, ЧТОБЫ ВЕРСТКА НЕ БЫЛА ИЗ БЛОКОВ IF СПЛОШНЫХ
// изменить название странци и экранов
//TODO saveResponse заэмитить

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: MyLinks.assetEnvApiKeys);
  await EasyLocalization.ensureInitialized();
  configureDependencies();

  runApp(LocalizationWrapper(
      child: EasyLocalization(
    supportedLocales: const [
      Locale('en'),
      Locale('ru'),
    ],
    path: MyLinks.assetTranslation,
    fallbackLocale: const Locale('en'),
    assetLoader: const CodegenLoader(),
    child: const MyApp(),
  )));
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
