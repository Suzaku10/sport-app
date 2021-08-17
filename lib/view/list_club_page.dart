import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sport_app_example/data/constant/enum.dart';
import 'package:sport_app_example/data/remote/team/team.dart';
import 'package:sport_app_example/material/generic_scaffold.dart';
import 'package:sport_app_example/store/list_club_store/list_club_store.dart';

class ListClubPage extends StatefulWidget {
  const ListClubPage({Key? key}) : super(key: key);

  @override
  _ListClubPageState createState() => _ListClubPageState();
}

class _ListClubPageState extends State<ListClubPage> {
  ListClubStore? _clubStore;

  @override
  void initState() {
    _clubStore ??= GetIt.I.get<ListClubStore>();
    _clubStore?.fetchAllCountry();
    _clubStore?.fetchLeague();
    _clubStore?.fetchTeams();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      appBar: AppBar(
        title: Text("Club List"),
      ),
      body: Observer(
        builder: (_) {
          switch (_clubStore?.teamsState) {
            case NetworkState.loading:
              return Center(
                child: CircularProgressIndicator(),
              );
            case NetworkState.loaded:
              return _listClubWidget;
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

  Widget get _listClubWidget {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Text(
                  "${_clubStore?.teams?.teams?.length ?? 0} club found in ${_clubStore?.teams?.teams?.first.strCountry}"),
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
}
