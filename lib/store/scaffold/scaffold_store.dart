import 'package:mobx/mobx.dart';
import 'package:sport_app_example/data/constant/enum.dart';

part 'scaffold_store.g.dart';

class ScaffoldStore = _ScaffoldStore with _$ScaffoldStore;

abstract class _ScaffoldStore with Store {
  @observable
  ScaffoldMessageState state = ScaffoldMessageState.initialMessage;

  @observable
  String? message;

  @action
  void removeState() {
    state = ScaffoldMessageState.initialMessage;
    message = null;
  }

  @action
  void setMessage(String msg) {
    message = msg;
    state = ScaffoldMessageState.showMessage;
  }
}
