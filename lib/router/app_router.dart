import 'package:auto_route/auto_route.dart';
import 'package:sport_app_example/view/home_page.dart';
import 'package:sport_app_example/view/league_detail_page.dart';
import 'package:sport_app_example/view/list_club_page.dart';
import 'package:sport_app_example/view/list_league_page.dart';
import 'package:sport_app_example/view/search_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: ListClubPage, path: '/list-club/:param'),
    AutoRoute(page: SearchPage, path: '/search/:inPage'),
    AutoRoute(page: ListLeaguePage, path: '/list-league/:country'),
    AutoRoute(
        page: LeagueDetailPage, path: '/league-detail/:leagueId:leagueName'),
  ],
)
class $AppRouter {}
