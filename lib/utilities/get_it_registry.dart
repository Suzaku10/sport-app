import 'package:get_it/get_it.dart';
import 'package:sport_app_example/store/home/home_store.dart';
import 'package:sport_app_example/store/list_club_store/list_club_store.dart';
import 'package:sport_app_example/store/scaffold/scaffold_store.dart';

final getItRegistry = GetItRegistry();

class GetItRegistry {
  registerStore() {
    // Store Scaffold
    GetIt.I.registerSingleton<ScaffoldStore>(ScaffoldStore());

    // Store ListClub
    GetIt.I.registerSingleton<ListClubStore>(ListClubStore());

    // Store Home
    GetIt.I.registerSingleton<HomeStore>(HomeStore());
  }
}
