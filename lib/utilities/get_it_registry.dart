import 'package:get_it/get_it.dart';
import 'package:sport_app_example/store/scaffold/scaffold_store.dart';

final getItRegistry = GetItRegistry();

class GetItRegistry {
  registerStore() {
    // Store Scaffold
    GetIt.I.registerSingleton<ScaffoldStore>(ScaffoldStore());
  }
}
