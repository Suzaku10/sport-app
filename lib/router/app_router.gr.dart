// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../view/home_page.dart' as _i3;
import '../view/league_detail_page.dart' as _i7;
import '../view/list_club_page.dart' as _i4;
import '../view/list_league_page.dart' as _i6;
import '../view/search_page.dart' as _i5;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.HomePage();
        }),
    ListClubRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final pathParams = data.pathParams;
          final args = data.argsAs<ListClubRouteArgs>(
              orElse: () =>
                  ListClubRouteArgs(param: pathParams.optString('param')));
          return _i4.ListClubPage(param: args.param);
        }),
    SearchRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final pathParams = data.pathParams;
          final args = data.argsAs<SearchRouteArgs>(
              orElse: () =>
                  SearchRouteArgs(inPage: pathParams.optString('inPage')));
          return _i5.SearchPage(inPage: args.inPage);
        }),
    ListLeagueRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final pathParams = data.pathParams;
          final args = data.argsAs<ListLeagueRouteArgs>(
              orElse: () => ListLeagueRouteArgs(
                  country: pathParams.optString('country')));
          return _i6.ListLeaguePage(country: args.country);
        }),
    LeagueDetailRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final pathParams = data.pathParams;
          final args = data.argsAs<LeagueDetailRouteArgs>(
              orElse: () => LeagueDetailRouteArgs(
                  leagueId: pathParams.optString('leagueId')));
          return _i7.LeagueDetailPage(leagueId: args.leagueId);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomeRoute.name, path: '/'),
        _i1.RouteConfig(ListClubRoute.name, path: '/list-club/:param'),
        _i1.RouteConfig(SearchRoute.name, path: '/search/:inPage'),
        _i1.RouteConfig(ListLeagueRoute.name, path: '/list-league/:country'),
        _i1.RouteConfig(LeagueDetailRoute.name,
            path: '/league-detail/:leagueId')
      ];
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/');

  static const String name = 'HomeRoute';
}

class ListClubRoute extends _i1.PageRouteInfo<ListClubRouteArgs> {
  ListClubRoute({String? param})
      : super(name,
            path: '/list-club/:param',
            args: ListClubRouteArgs(param: param),
            rawPathParams: {'param': param});

  static const String name = 'ListClubRoute';
}

class ListClubRouteArgs {
  const ListClubRouteArgs({this.param});

  final String? param;
}

class SearchRoute extends _i1.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({String? inPage})
      : super(name,
            path: '/search/:inPage',
            args: SearchRouteArgs(inPage: inPage),
            rawPathParams: {'inPage': inPage});

  static const String name = 'SearchRoute';
}

class SearchRouteArgs {
  const SearchRouteArgs({this.inPage});

  final String? inPage;
}

class ListLeagueRoute extends _i1.PageRouteInfo<ListLeagueRouteArgs> {
  ListLeagueRoute({String? country})
      : super(name,
            path: '/list-league/:country',
            args: ListLeagueRouteArgs(country: country),
            rawPathParams: {'country': country});

  static const String name = 'ListLeagueRoute';
}

class ListLeagueRouteArgs {
  const ListLeagueRouteArgs({this.country});

  final String? country;
}

class LeagueDetailRoute extends _i1.PageRouteInfo<LeagueDetailRouteArgs> {
  LeagueDetailRoute({String? leagueId})
      : super(name,
            path: '/league-detail/:leagueId',
            args: LeagueDetailRouteArgs(leagueId: leagueId),
            rawPathParams: {'leagueId': leagueId});

  static const String name = 'LeagueDetailRoute';
}

class LeagueDetailRouteArgs {
  const LeagueDetailRouteArgs({this.leagueId});

  final String? leagueId;
}
