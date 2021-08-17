import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sport_app_example/data/constant/color.dart';
import 'package:sport_app_example/data/constant/const_variable.dart';
import 'package:sport_app_example/data/constant/enum.dart';
import 'package:sport_app_example/data/remote/country/country.dart';
import 'package:sport_app_example/material/generic_scaffold.dart';
import 'package:auto_route/auto_route.dart';
import 'package:sport_app_example/router/app_router.gr.dart';
import 'package:sport_app_example/store/home/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore? _homeStore;
  late TextEditingController _controller;

  @override
  void initState() {
    _homeStore ??= GetIt.I.get<HomeStore>();
    _homeStore?.fetchAllCountry();
    _homeStore?.clearFiltered();
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      appBar: AppBar(
        title: Text("Sport App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.centerRight,
            width: double.infinity,
            child: InkWell(
              onTap: () => _showBottomSheet(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Observer(
                  builder: (_) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${_homeStore?.country}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Icon(Icons.arrow_drop_down_sharp)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemBuilder: (context, index) => _itemCardWidget(index),
              itemCount: team_menu.length,
              separatorBuilder: (context, index) => Container(
                height: 8,
                width: double.infinity,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _itemCardWidget(int index) {
    return InkWell(
      onTap: () => _navigateToSource(team_menu[index]),
      child: Card(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: gold,
              padding: EdgeInsets.all(8),
              child: Text(
                team_menu[index],
                style: TextStyle(color: black, fontSize: 40),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_forward),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _listCountryWidget() {
    return Observer(
      builder: (_) {
        switch (_homeStore?.countriesState) {
          case NetworkState.loading:
            return Container(
              constraints: BoxConstraints(maxHeight: 400),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case NetworkState.loaded:
            return _listWidget();
          case NetworkState.error:
            return Text(error_message);
          default:
            return Container();
        }
      },
    );
  }

  Widget _listWidget() {
    return Observer(
      builder: (_) {
        if (_homeStore?.filteredCountries == null) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: (_homeStore?.countries?.countries?.length ?? 0),
            itemBuilder: (context, index) =>
                _itemCountryWidget(_homeStore?.countries?.countries![index]),
            separatorBuilder: (context, index) =>
                Container(height: 1, width: double.infinity, color: black),
          );
        } else {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: (_homeStore?.filteredCountries?.countries?.length ?? 0),
            itemBuilder: (context, index) => _itemCountryWidget(
                _homeStore?.filteredCountries?.countries![index]),
            separatorBuilder: (context, index) =>
                Container(height: 1, width: double.infinity, color: black),
          );
        }
      },
    );
  }

  Widget _itemCountryWidget(Country? country) {
    return InkWell(
      onTap: () => Navigator.pop(context, country?.nameEn),
      child: Container(
        alignment: Alignment.centerLeft,
        height: kToolbarHeight,
        width: double.infinity,
        child: Text("${country?.nameEn}"),
      ),
    );
  }

  Widget _searchWidget() {
    return Container(
      constraints: BoxConstraints(maxHeight: kToolbarHeight - 10),
      decoration: BoxDecoration(
          border: Border.all(color: black),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              onChanged: (_) =>
                  _homeStore?.filterCountriesByKeyword(_controller.text),
              onSubmitted: (_) =>
                  _homeStore?.filterCountriesByKeyword(_controller.text),
              style: TextStyle(color: black),
              decoration: InputDecoration(
                  hintText: "Search Country",
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  enabledBorder: InputBorder.none),
            ),
          ),
          GestureDetector(
            onTap: () => _clearSearch(),
            child: Container(
              child: Icon(Icons.close),
              padding: EdgeInsets.symmetric(horizontal: 10),
            ),
          )
        ],
      ),
    );
  }

  void _clearSearch() {
    _homeStore?.clearFiltered();
    _controller.clear();
  }

  void _navigateToSource(String menu) async {
    if (menu == team_menu[0]) {
      await context.pushRoute(
        ListClubRoute(param: _homeStore?.country),
      );
    } else {
      await context.pushRoute(
        ListLeagueRoute(country: _homeStore?.country),
      );
    }
  }

  void _showBottomSheet() async {
    _clearSearch();
    String? result = await showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        builder: (_) {
          return Container(
            constraints: BoxConstraints(
                maxHeight: (MediaQuery.of(context).size.height * 2) / 3),
            child: Column(
              children: [
                _searchWidget(),
                Expanded(
                  child: _listCountryWidget(),
                )
              ],
            ),
          );
        });

    if (result != null) {
      _homeStore?.selectedCountry(selectedCountry: result);
    }
  }
}
