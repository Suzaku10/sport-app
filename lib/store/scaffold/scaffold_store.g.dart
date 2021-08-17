// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scaffold_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScaffoldStore on _ScaffoldStore, Store {
  final _$stateAtom = Atom(name: '_ScaffoldStore.state');

  @override
  ScaffoldMessageState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ScaffoldMessageState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$messageAtom = Atom(name: '_ScaffoldStore.message');

  @override
  String? get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String? value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  final _$_ScaffoldStoreActionController =
      ActionController(name: '_ScaffoldStore');

  @override
  void removeState() {
    final _$actionInfo = _$_ScaffoldStoreActionController.startAction(
        name: '_ScaffoldStore.removeState');
    try {
      return super.removeState();
    } finally {
      _$_ScaffoldStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMessage(String msg) {
    final _$actionInfo = _$_ScaffoldStoreActionController.startAction(
        name: '_ScaffoldStore.setMessage');
    try {
      return super.setMessage(msg);
    } finally {
      _$_ScaffoldStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
message: ${message}
    ''';
  }
}
