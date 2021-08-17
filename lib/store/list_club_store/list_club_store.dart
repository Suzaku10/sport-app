import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_app_example/data/constant/const_variable.dart';
import 'package:sport_app_example/data/constant/enum.dart';
import 'package:sport_app_example/data/remote/response/country_response/country_response.dart';
import 'package:sport_app_example/data/remote/response/league_response/league_response.dart';
import 'package:sport_app_example/data/remote/response/team_response/team_response.dart';
import 'package:sport_app_example/data/repository/sport_repository.dart';
import 'package:sport_app_example/store/scaffold/scaffold_store.dart';

part 'list_club_store.g.dart';

class ListClubStore = _ListClubStore with _$ListClubStore;

abstract class _ListClubStore with Store {
  SportRepositoryImpl _sportRepositoryImpl = SportRepositoryImpl();
  ScaffoldStore store = GetIt.I.get<ScaffoldStore>();

  @observable
  CountryResponse? countries;

  @observable
  LeagueResponse? leagues;

  @observable
  TeamResponse? teams;

  @observable
  ObservableFuture? _countriesFuture;

  @observable
  ObservableFuture? _teamsFuture;

  @observable
  ObservableFuture? _leagueFuture;

  @computed
  NetworkState get countriesState {
    if (_countriesFuture?.status == FutureStatus.rejected) {
      return NetworkState.error;
    }

    return _countriesFuture?.status == FutureStatus.pending
        ? NetworkState.loading
        : NetworkState.loaded;
  }

  @computed
  NetworkState get leaguesState {
    if (_leagueFuture?.status == FutureStatus.rejected) {
      return NetworkState.error;
    }

    return _leagueFuture?.status == FutureStatus.pending
        ? NetworkState.loading
        : NetworkState.loaded;
  }

  @computed
  NetworkState get teamsState {
    if (_teamsFuture?.status == FutureStatus.rejected) {
      return NetworkState.error;
    }

    return _teamsFuture?.status == FutureStatus.pending
        ? NetworkState.loading
        : NetworkState.loaded;
  }

  @action
  Future<void> fetchAllCountry() async {
    try {
      _countriesFuture =
          ObservableFuture(_sportRepositoryImpl.fetchAllCountry());
      countries = await _countriesFuture;
    } catch (e) {
      store.setMessage(error_message);
    }
  }

  @action
  Future<void> fetchLeague({String? country}) async {
    try {
      _leagueFuture = ObservableFuture(
          _sportRepositoryImpl.fetchLeaguesInCountry(country: country));
      leagues = await _leagueFuture;
    } catch (e) {
      store.setMessage(error_message);
    }
  }

  @action
  Future<void> fetchTeams({String? country, String? league}) async {
    try {
      if (league == null) {
        _teamsFuture = ObservableFuture(
            _sportRepositoryImpl.fetchTeamsByCountry(country: country));
      } else if (country == null) {
        _teamsFuture = ObservableFuture(
            _sportRepositoryImpl.fetchTeamsByLeague(league: league));
      } else {
        throw Exception();
      }

      store.setMessage(success_message);
      teams = await _teamsFuture;
    } catch (e) {
      store.setMessage(error_message);
    }
  }
}
