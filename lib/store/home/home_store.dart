import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sport_app_example/data/constant/const_variable.dart';
import 'package:sport_app_example/data/constant/enum.dart';
import 'package:sport_app_example/data/remote/country/country.dart';
import 'package:sport_app_example/data/remote/response/country_response/country_response.dart';
import 'package:sport_app_example/data/repository/sport_repository.dart';
import 'package:sport_app_example/store/scaffold/scaffold_store.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  SportRepositoryImpl _sportRepositoryImpl = SportRepositoryImpl();
  ScaffoldStore _store = GetIt.I.get<ScaffoldStore>();

  @observable
  String country = default_country;

  @observable
  CountryResponse? countries;

  @observable
  CountryResponse? filteredCountries;

  @observable
  ObservableFuture? _countriesFuture;

  @computed
  NetworkState get countriesState {
    if (_countriesFuture?.status == FutureStatus.rejected) {
      return NetworkState.error;
    }

    return _countriesFuture?.status == FutureStatus.pending
        ? NetworkState.loading
        : NetworkState.loaded;
  }

  @action
  void selectedCountry({String? selectedCountry}) {
    country = selectedCountry ?? default_country;
  }

  @action
  Future<void> fetchAllCountry() async {
    try {
      _countriesFuture =
          ObservableFuture(_sportRepositoryImpl.fetchAllCountry());
      countries = await _countriesFuture;
    } catch (e) {
      _store.setMessage(error_message);
    }
  }

  @action
  void filterCountriesByKeyword(String? keyword) {
    CountryResponse? _countries = countries;

    List<Country>? _newCountries = _countries?.countries
        ?.where(
          (element) =>
              element.nameEn!.toLowerCase().contains(keyword!.toLowerCase()),
        )
        .toList();
    _countries = CountryResponse(countries: _newCountries);

    filteredCountries = _countries;
  }

  @action
  void clearFiltered() {
    filteredCountries = null;
  }
}
