import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sport_app_example/data/constant/color.dart';
import 'package:sport_app_example/data/constant/enum.dart';
import 'package:sport_app_example/data/remote/league/league.dart';
import 'package:sport_app_example/data/remote/team/team.dart';
import 'package:sport_app_example/material/empty_widget.dart';
import 'package:sport_app_example/material/error_widget.dart';
import 'package:sport_app_example/material/generic_scaffold.dart';
import 'package:sport_app_example/router/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:sport_app_example/store/list_club/list_club_store.dart';

class ListClubPage extends StatefulWidget {
  final String? param;

  const ListClubPage({@PathParam('param') this.param});

  @override
  _ListClubPageState createState() => _ListClubPageState();
}

class _ListClubPageState extends State<ListClubPage> {
  ListClubStore? _clubStore;

  @override
  void initState() {
    _clubStore ??= GetIt.I.get<ListClubStore>();
    _clubStore?.fetchLeague(country: widget.param);
    _clubStore?.fetchTeams(country: widget.param);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      appBar: AppBar(
        title: Text("Club List"),
        actions: [
          InkWell(
            onTap: () => _navigateToSearch(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.search),
            ),
          ),
          InkWell(
            onTap: () => _showBottomSheet(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.filter_alt),
            ),
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          switch (_clubStore?.teamsState) {
            case NetworkState.loading:
              return Center(
                child: CircularProgressIndicator(),
              );
            case NetworkState.loaded:
              return _clubStore?.teams?.teams == null
                  ? EmptyWidget()
                  : _listClubWidget;
            case NetworkState.error:
              return SomethingErrorWidget();
            default:
              return Container();
          }
        },
      ),
    );
  }

  Widget get _listClubWidget {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Text("${_clubStore?.teams?.teams?.length ?? 0} club found"),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: (_clubStore?.teams?.teams?.length ?? 0),
            itemBuilder: (context, index) =>
                _itemClubWidget(_clubStore?.teams?.teams![index]),
            separatorBuilder: (context, index) => Container(height: 8),
          ),
        )
      ],
    );
  }

  Widget _itemClubWidget(Team? team) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text("${team?.strTeam}", textAlign: TextAlign.center),
            ),
            if (team?.strTeamBadge != null)
              Image(
                image: NetworkImage("${team?.strTeamBadge}/tiny"),
              ),
          ],
        ),
      ),
    );
  }

  Widget _listLeagueWidget() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: (_clubStore?.leagues?.countrys?.length ?? 0),
      itemBuilder: (context, index) =>
          _itemLeagueWidget(_clubStore?.leagues?.countrys![index]),
      separatorBuilder: (context, index) =>
          Container(height: 1, width: double.infinity, color: black),
    );
  }

  Widget _itemLeagueWidget(League? league) {
    return InkWell(
      onTap: () => Navigator.pop(context, league?.strLeague),
      child: Container(
        alignment: Alignment.centerLeft,
        height: kToolbarHeight,
        width: double.infinity,
        child: Text("${league?.strLeague}"),
      ),
    );
  }

  void _navigateToSearch() async {
    final result = await context.pushRoute(
      SearchRoute(
        inPage: (ListClubPage).toString(),
      ),
    );

    if (result != null) {
      _clubStore?.searchTeamByKeyword(keyword: "$result");
    }
  }

  void _showBottomSheet() async {
    String? result = await showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        builder: (_) {
          return _listLeagueWidget();
        });

    if (result != null) {
      _clubStore?.fetchTeams(league: result);
    }
  }
}
