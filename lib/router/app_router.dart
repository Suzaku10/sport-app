import 'package:auto_route/auto_route.dart';
import 'package:sport_app_example/view/list_club_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: ListClubPage, initial: true),
  ],
)
class $AppRouter {}
