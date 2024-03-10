import 'package:auto_route/auto_route.dart';
import 'package:retrofit_moment/core/route/route.gr.dart';


@AutoRouterConfig()
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
        page: AutoTabsScaffolRoute.page,
        initial: true,
    children: [
      AutoRoute(
          page: FirstRoute.page),
      AutoRoute(
          page: SecondRoute.page),
      AutoRoute(
          page: ThirdRoute.page),
    ]),
  ];
}