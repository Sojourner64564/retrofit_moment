// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:retrofit_moment/features/common/presentation/screens/auto_tabs_scaffold/auto_tabs_scaffold.dart'
    as _i1;
import 'package:retrofit_moment/features/latest_news_feature/presentation/screens/first_screen/first_screen.dart'
    as _i2;
import 'package:retrofit_moment/features/search_news_feature/presentation/screens/second_screen/second_screen.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    AutoTabsScaffolRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AutoTabsScaffolPage(),
      );
    },
    FirstRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.FirstScreen(),
      );
    },
    SecondRoute.name: (routeData) {
      final args = routeData.argsAs<SecondRouteArgs>(
          orElse: () => const SecondRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.SecondScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.AutoTabsScaffolPage]
class AutoTabsScaffolRoute extends _i4.PageRouteInfo<void> {
  const AutoTabsScaffolRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AutoTabsScaffolRoute.name,
          initialChildren: children,
        );

  static const String name = 'AutoTabsScaffolRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FirstScreen]
class FirstRoute extends _i4.PageRouteInfo<void> {
  const FirstRoute({List<_i4.PageRouteInfo>? children})
      : super(
          FirstRoute.name,
          initialChildren: children,
        );

  static const String name = 'FirstRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SecondScreen]
class SecondRoute extends _i4.PageRouteInfo<SecondRouteArgs> {
  SecondRoute({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          SecondRoute.name,
          args: SecondRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SecondRoute';

  static const _i4.PageInfo<SecondRouteArgs> page =
      _i4.PageInfo<SecondRouteArgs>(name);
}

class SecondRouteArgs {
  const SecondRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'SecondRouteArgs{key: $key}';
  }
}
