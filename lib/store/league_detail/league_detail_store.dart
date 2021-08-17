import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_app_example/data/repository/sport_repository.dart';
import 'package:sport_app_example/store/scaffold/scaffold_store.dart';

part 'league_detail_store.g.dart';

class LeagueDetailStore = _LeagueDetailStore with _$LeagueDetailStore;

abstract class _LeagueDetailStore with Store {
  SportRepositoryImpl _sportRepositoryImpl = SportRepositoryImpl();
  ScaffoldStore _store = GetIt.I.get<ScaffoldStore>();

}
