// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LeagueDetailStore on _LeagueDetailStore, Store {
  Computed<NetworkState>? _$detailStateComputed;

  @override
  NetworkState get detailState =>
      (_$detailStateComputed ??= Computed<NetworkState>(() => super.detailState,
              name: '_LeagueDetailStore.detailState'))
          .value;

  final _$leagueDetailAtom = Atom(name: '_LeagueDetailStore.leagueDetail');

  @override
  EventResponse? get leagueDetail {
    _$leagueDetailAtom.reportRead();
    return super.leagueDetail;
  }

  @override
  set leagueDetail(EventResponse? value) {
    _$leagueDetailAtom.reportWrite(value, super.leagueDetail, () {
      super.leagueDetail = value;
    });
  }

  final _$_leagueDetailFutureAtom =
      Atom(name: '_LeagueDetailStore._leagueDetailFuture');

  @override
  ObservableFuture<dynamic>? get _leagueDetailFuture {
    _$_leagueDetailFutureAtom.reportRead();
    return super._leagueDetailFuture;
  }

  @override
  set _leagueDetailFuture(ObservableFuture<dynamic>? value) {
    _$_leagueDetailFutureAtom.reportWrite(value, super._leagueDetailFuture, () {
      super._leagueDetailFuture = value;
    });
  }

  final _$seasonAtom = Atom(name: '_LeagueDetailStore.season');

  @override
  String? get season {
    _$seasonAtom.reportRead();
    return super.season;
  }

  @override
  set season(String? value) {
    _$seasonAtom.reportWrite(value, super.season, () {
      super.season = value;
    });
  }

  final _$fetchLeagueDetailInSeasonAsyncAction =
      AsyncAction('_LeagueDetailStore.fetchLeagueDetailInSeason');

  @override
  Future<void> fetchLeagueDetailInSeason({String? leagueId, String? season}) {
    return _$fetchLeagueDetailInSeasonAsyncAction.run(() =>
        super.fetchLeagueDetailInSeason(leagueId: leagueId, season: season));
  }

  final _$selectSeasonAsyncAction =
      AsyncAction('_LeagueDetailStore.selectSeason');

  @override
  Future<void> selectSeason(String leagueId, {String? selectedSeason}) {
    return _$selectSeasonAsyncAction.run(
        () => super.selectSeason(leagueId, selectedSeason: selectedSeason));
  }

  @override
  String toString() {
    return '''
leagueDetail: ${leagueDetail},
season: ${season},
detailState: ${detailState}
    ''';
  }
}
