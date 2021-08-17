// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_league_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListLeagueStore on _ListLeagueStore, Store {
  Computed<NetworkState>? _$leaguesStateComputed;

  @override
  NetworkState get leaguesState => (_$leaguesStateComputed ??=
          Computed<NetworkState>(() => super.leaguesState,
              name: '_ListLeagueStore.leaguesState'))
      .value;

  final _$leaguesAtom = Atom(name: '_ListLeagueStore.leagues');

  @override
  LeagueResponse? get leagues {
    _$leaguesAtom.reportRead();
    return super.leagues;
  }

  @override
  set leagues(LeagueResponse? value) {
    _$leaguesAtom.reportWrite(value, super.leagues, () {
      super.leagues = value;
    });
  }

  final _$_leaguesFutureAtom = Atom(name: '_ListLeagueStore._leaguesFuture');

  @override
  ObservableFuture<dynamic>? get _leaguesFuture {
    _$_leaguesFutureAtom.reportRead();
    return super._leaguesFuture;
  }

  @override
  set _leaguesFuture(ObservableFuture<dynamic>? value) {
    _$_leaguesFutureAtom.reportWrite(value, super._leaguesFuture, () {
      super._leaguesFuture = value;
    });
  }

  final _$fetchLeagueInCountryAsyncAction =
      AsyncAction('_ListLeagueStore.fetchLeagueInCountry');

  @override
  Future<void> fetchLeagueInCountry(String country) {
    return _$fetchLeagueInCountryAsyncAction
        .run(() => super.fetchLeagueInCountry(country));
  }

  @override
  String toString() {
    return '''
leagues: ${leagues},
leaguesState: ${leaguesState}
    ''';
  }
}
