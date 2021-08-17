import 'package:auto_route/auto_route.dart';
import 'package:sport_app_example/view/home_page.dart';
import 'package:sport_app_example/view/list_club_page.dart';
import 'package:sport_app_example/view/search_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: ListClubPage, path: '/list-club/:param'),
    AutoRoute(page: SearchPage, path: '/search/:inPage'),
  ],
)
class $AppRouter {}
