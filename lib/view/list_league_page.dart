import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sport_app_example/data/constant/color.dart';
import 'package:sport_app_example/data/constant/enum.dart';
import 'package:sport_app_example/data/remote/league/league.dart';
import 'package:sport_app_example/material/generic_scaffold.dart';
import 'package:sport_app_example/router/app_router.gr.dart';
import 'package:sport_app_example/store/list_league/list_league_store.dart';
import 'package:sport_app_example/view/league_detail_page.dart';

class ListLeaguePage extends StatefulWidget {
  final String? country;

  const ListLeaguePage({@PathParam('country') this.country});

  @override
  _ListLeaguePageState createState() => _ListLeaguePageState();
}

class _ListLeaguePageState extends State<ListLeaguePage> {
  ListLeagueStore? _leagueStore;

  @override
  void initState() {
    _leagueStore ??= GetIt.I.get<ListLeagueStore>();
    _leagueStore?.fetchLeagueInCountry(widget.country!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      appBar: AppBar(
        title: Text("List League"),
      ),
      body: Observer(
        builder: (_) {
          switch (_leagueStore?.leaguesState) {
            case NetworkState.loading:
              return Center(
                child: CircularProgressIndicator(),
              );
            case NetworkState.loaded:
              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: (_leagueStore?.leagues?.countrys?.length ?? 0),
                itemBuilder: (context, index) =>
                    _itemLeagueWidget(_leagueStore?.leagues?.countrys![index]),
                separatorBuilder: (context, index) =>
                    Container(height: 1, width: double.infinity, color: black),
              );
            case NetworkState.error:
              return Center(
                child: Text("Something Error"),
              );
            default:
              return Container();
          }
        },
      ),
    );
  }

  Widget _itemLeagueWidget(League? league) {
    return InkWell(
      onTap: () => _navigateToLeagueDetail(league?.idLeague),
      child: Container(
        alignment: Alignment.centerLeft,
        height: kToolbarHeight,
        width: double.infinity,
        child: Text("${league?.strLeague}"),
      ),
    );
  }

  void _navigateToLeagueDetail(String? leagueId) {
    context.pushRoute(LeagueDetailRoute(leagueId: leagueId));
  }
}
