import 'package:api_base/presentation/navigation/navigation.dart';
import 'package:api_base/presentation/pages/api_test/api_test_screen.dart';
import 'package:api_base/presentation/pages/pages.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LetInYouRoute.page),
        AutoRoute(
          page: MainAppRoute.page,
          children: [
            AutoRoute(
              page: HomeNavigationRoute.page,
              initial: true,
              children: [
                AutoRoute(page: HomeRoute.page, initial: true),
                AutoRoute(page: TvShowsRoute.page),
                AutoRoute(page: FavoriteRoute.page),
                AutoRoute(page: SearchRoute.page),
                AutoRoute(page: ProfileRoute.page),
                AutoRoute(page: ShowAllRoute.page),
                AutoRoute(page: MovieDetailRoute.page),
              ],
            ),
            AutoRoute(page: TvShowsNavigationRoute.page),
            AutoRoute(page: FavoriteNavigationRoute.page),
            AutoRoute(page: SearchNavigationRoute.page),
            AutoRoute(page: ProfileNavigationRoute.page),
          ],
        ),
        AutoRoute(page: ApiTestRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
      ];
}
