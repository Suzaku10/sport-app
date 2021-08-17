// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  Computed<NetworkState>? _$countriesStateComputed;

  @override
  NetworkState get countriesState => (_$countriesStateComputed ??=
          Computed<NetworkState>(() => super.countriesState,
              name: '_HomeStore.countriesState'))
      .value;

  final _$countryAtom = Atom(name: '_HomeStore.country');

  @override
  String get country {
    _$countryAtom.reportRead();
    return super.country;
  }

  @override
  set country(String value) {
    _$countryAtom.reportWrite(value, super.country, () {
      super.country = value;
    });
  }

  final _$countriesAtom = Atom(name: '_HomeStore.countries');

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

  final _$filteredCountriesAtom = Atom(name: '_HomeStore.filteredCountries');

  @override
  CountryResponse? get filteredCountries {
    _$filteredCountriesAtom.reportRead();
    return super.filteredCountries;
  }

  @override
  set filteredCountries(CountryResponse? value) {
    _$filteredCountriesAtom.reportWrite(value, super.filteredCountries, () {
      super.filteredCountries = value;
    });
  }

  final _$_countriesFutureAtom = Atom(name: '_HomeStore._countriesFuture');

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

  final _$fetchAllCountryAsyncAction =
      AsyncAction('_HomeStore.fetchAllCountry');

  @override
  Future<void> fetchAllCountry() {
    return _$fetchAllCountryAsyncAction.run(() => super.fetchAllCountry());
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  void selectedCountry({String? selectedCountry}) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.selectedCountry');
    try {
      return super.selectedCountry(selectedCountry: selectedCountry);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterCountriesByKeyword(String? keyword) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.filterCountriesByKeyword');
    try {
      return super.filterCountriesByKeyword(keyword);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFiltered() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.clearFiltered');
    try {
      return super.clearFiltered();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
country: ${country},
countries: ${countries},
filteredCountries: ${filteredCountries},
countriesState: ${countriesState}
    ''';
  }
}
