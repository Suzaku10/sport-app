// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_club_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListClubStore on _ListClubStore, Store {
  Computed<NetworkState>? _$countriesStateComputed;

  @override
  NetworkState get countriesState => (_$countriesStateComputed ??=
          Computed<NetworkState>(() => super.countriesState,
              name: '_ListClubStore.countriesState'))
      .value;
  Computed<NetworkState>? _$leaguesStateComputed;

  @override
  NetworkState get leaguesState => (_$leaguesStateComputed ??=
          Computed<NetworkState>(() => super.leaguesState,
              name: '_ListClubStore.leaguesState'))
      .value;
  Computed<NetworkState>? _$teamsStateComputed;

  @override
  NetworkState get teamsState =>
      (_$teamsStateComputed ??= Computed<NetworkState>(() => super.teamsState,
              name: '_ListClubStore.teamsState'))
          .value;

  final _$countriesAtom = Atom(name: '_ListClubStore.countries');

  @override
  CountryResponse? get countries {
    _$countriesAtom.reportRead();
    return super.countries;
  }

  @override
  set countries(CountryResponse? value) {
    _$countriesAtom.reportWrite(value, super.countries, () {
      super.countries = value;
    });
  }

  final _$leaguesAtom = Atom(name: '_ListClubStore.leagues');

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

  final _$teamsAtom = Atom(name: '_ListClubStore.teams');

  @override
  TeamResponse? get teams {
    _$teamsAtom.reportRead();
    return super.teams;
  }

  @override
  set teams(TeamResponse? value) {
    _$teamsAtom.reportWrite(value, super.teams, () {
      super.teams = value;
    });
  }

  final _$_countriesFutureAtom = Atom(name: '_ListClubStore._countriesFuture');

  @override
  ObservableFuture<dynamic>? get _countriesFuture {
    _$_countriesFutureAtom.reportRead();
    return super._countriesFuture;
  }

  @override
  set _countriesFuture(ObservableFuture<dynamic>? value) {
    _$_countriesFutureAtom.reportWrite(value, super._countriesFuture, () {
      super._countriesFuture = value;
    });
  }

  final _$_teamsFutureAtom = Atom(name: '_ListClubStore._teamsFuture');

  @override
  ObservableFuture<dynamic>? get _teamsFuture {
    _$_teamsFutureAtom.reportRead();
    return super._teamsFuture;
  }

  @override
  set _teamsFuture(ObservableFuture<dynamic>? value) {
    _$_teamsFutureAtom.reportWrite(value, super._teamsFuture, () {
      super._teamsFuture = value;
    });
  }

  final _$_leagueFutureAtom = Atom(name: '_ListClubStore._leagueFuture');

  @override
  ObservableFuture<dynamic>? get _leagueFuture {
    _$_leagueFutureAtom.reportRead();
    return super._leagueFuture;
  }

  @override
  set _leagueFuture(ObservableFuture<dynamic>? value) {
    _$_leagueFutureAtom.reportWrite(value, super._leagueFuture, () {
      super._leagueFuture = value;
    });
  }

  final _$fetchAllCountryAsyncAction =
      AsyncAction('_ListClubStore.fetchAllCountry');

  @override
  Future<void> fetchAllCountry() {
    return _$fetchAllCountryAsyncAction.run(() => super.fetchAllCountry());
  }

  final _$fetchLeagueAsyncAction = AsyncAction('_ListClubStore.fetchLeague');

  @override
  Future<void> fetchLeague({String? country}) {
    return _$fetchLeagueAsyncAction
        .run(() => super.fetchLeague(country: country));
  }

  final _$fetchTeamsAsyncAction = AsyncAction('_ListClubStore.fetchTeams');

  @override
  Future<void> fetchTeams({String? country, String? league}) {
    return _$fetchTeamsAsyncAction
        .run(() => super.fetchTeams(country: country, league: league));
  }

  @override
  String toString() {
    return '''
countries: ${countries},
leagues: ${leagues},
teams: ${teams},
countriesState: ${countriesState},
leaguesState: ${leaguesState},
teamsState: ${teamsState}
    ''';
  }
}
