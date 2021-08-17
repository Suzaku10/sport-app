import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_app_example/data/constant/const_variable.dart';
import 'package:sport_app_example/data/constant/enum.dart';
import 'package:sport_app_example/data/remote/response/event_response/event_response.dart';
import 'package:sport_app_example/data/repository/sport_repository.dart';
import 'package:sport_app_example/store/scaffold/scaffold_store.dart';
import 'package:sport_app_example/utilities/func_utilities.dart';

part 'league_detail_store.g.dart';

class LeagueDetailStore = _LeagueDetailStore with _$LeagueDetailStore;

abstract class _LeagueDetailStore with Store {
  SportRepositoryImpl _sportRepositoryImpl = SportRepositoryImpl();
  ScaffoldStore _store = GetIt.I.get<ScaffoldStore>();

  @observable
  EventResponse? leagueDetail;

  @observable
  ObservableFuture? _leagueDetailFuture;

  @observable
  String? season = FuncUtilities.season.first;

  @computed
  NetworkState get detailState {
    if (_leagueDetailFuture?.status == FutureStatus.rejected) {
      return NetworkState.error;
    }

    return _leagueDetailFuture?.status == FutureStatus.pending
        ? NetworkState.loading
        : NetworkState.loaded;
  }

  @action
  Future<void> fetchLeagueDetailInSeason(
      {String? leagueId, String? season}) async {
    try {
      _leagueDetailFuture = ObservableFuture(_sportRepositoryImpl
          .leagueDetailInSeason(leagueId: leagueId, season: season));

      leagueDetail = await _leagueDetailFuture;
      if (leagueDetail == null) throw empty_message;
      _store.setMessage(success_message);
    } catch (e) {
      if (e == empty_message) {
        _store.setMessage(empty_message);
      } else {
        _store.setMessage(error_message);
      }
    }
  }

  @action
  Future<void> selectSeason(String leagueId, {String? selectedSeason}) async {
    season = selectedSeason ?? FuncUtilities.season.first;
    await fetchLeagueDetailInSeason(leagueId: leagueId, season: season);
  }
}
