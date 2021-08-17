// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../view/home_page.dart' as _i3;
import '../view/list_club_page.dart' as _i4;
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
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomeRoute.name, path: '/'),
        _i1.RouteConfig(ListClubRoute.name, path: '/list-club/:param'),
        _i1.RouteConfig(SearchRoute.name, path: '/search/:inPage')
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
