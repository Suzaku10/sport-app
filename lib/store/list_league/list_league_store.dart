import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_app_example/data/constant/const_variable.dart';
import 'package:sport_app_example/data/constant/enum.dart';
import 'package:sport_app_example/data/remote/response/league_response/league_response.dart';
import 'package:sport_app_example/data/repository/sport_repository.dart';
import 'package:sport_app_example/store/scaffold/scaffold_store.dart';

part 'list_league_store.g.dart';

class ListLeagueStore = _ListLeagueStore with _$ListLeagueStore;

abstract class _ListLeagueStore with Store {
  SportRepositoryImpl _sportRepositoryImpl = SportRepositoryImpl();
  ScaffoldStore _store = GetIt.I.get<ScaffoldStore>();

  @observable
  LeagueResponse? leagues;

  @observable
  ObservableFuture? _leaguesFuture;

  @computed
  NetworkState get leaguesState {
    if (_leaguesFuture?.status == FutureStatus.rejected) {
      return NetworkState.error;
    }

    return _leaguesFuture?.status == FutureStatus.pending
        ? NetworkState.loading
        : NetworkState.loaded;
  }

  @action
  Future<void> fetchLeagueInCountry(String country) async {
    try {
      _leaguesFuture = ObservableFuture(
          _sportRepositoryImpl.fetchLeaguesInCountry(country: country));
      leagues = await _leaguesFuture;

      _store.setMessage(success_message);
    } catch (e) {
      _store.setMessage(error_message);
    }
  }
}
