import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:retrofit_moment/core/easy_localization/codegen_loader.g.dart';
import 'package:retrofit_moment/core/links/my_links.dart';

class LocalizationWrapper extends StatelessWidget {
  final Widget child;

  const LocalizationWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      path: MyLinks.assetTranslation,
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: child,
    );
  }
}
