import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sport_app_example/data/constant/color.dart';
import 'package:sport_app_example/data/constant/enum.dart';
import 'package:sport_app_example/data/remote/event/event.dart';
import 'package:sport_app_example/material/empty_widget.dart';
import 'package:sport_app_example/material/error_widget.dart';
import 'package:sport_app_example/material/generic_scaffold.dart';
import 'package:sport_app_example/store/league_detail/league_detail_store.dart';
import 'package:sport_app_example/utilities/func_utilities.dart';

class LeagueDetailPage extends StatefulWidget {
  final String? leagueId;
  final String? leagueName;

  const LeagueDetailPage(
      {@PathParam('leagueId') this.leagueId,
      @PathParam('leagueName') this.leagueName});

  @override
  _LeagueDetailPageState createState() => _LeagueDetailPageState();
}

class _LeagueDetailPageState extends State<LeagueDetailPage> {
  LeagueDetailStore? _detailStore;

  @override
  void initState() {
    _detailStore ??= GetIt.I.get<LeagueDetailStore>();
    _detailStore?.selectSeason(widget.leagueId!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      appBar: AppBar(
        title: Text("League Detail"),
      ),
      body: Observer(builder: (_) {
        switch (_detailStore?.detailState) {
          case NetworkState.loading:
            return Center(
              child: CircularProgressIndicator(),
            );
          case NetworkState.loaded:
            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.leagueName!,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        onTap: () => _showBottomSheet(),
                        child: Observer(
                          builder: (_) => Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${_detailStore?.season}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Icon(Icons.arrow_drop_down_sharp)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: _detailStore?.leagueDetail?.events == null
                      ? EmptyWidget()
                      : _listEventWidget,
                )
              ],
            );
          case NetworkState.error:
            return SomethingErrorWidget();
          default:
            return Container();
        }
      }),
    );
  }

  Widget get _listEventWidget {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: (_detailStore?.leagueDetail?.events?.length ?? 0),
      itemBuilder: (context, index) =>
          _itemEventWidget(_detailStore?.leagueDetail?.events![index]),
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(height: 1, width: double.infinity),
      ),
    );
  }

  Widget _itemEventWidget(Event? event) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${event?.strEvent}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${event?.intHomeScore} : ${event?.intAwayScore}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4),
              alignment: Alignment.centerRight,
              child: Text("${event?.dateEvent} ${event?.strTime}"),
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }

  Widget get _listSeason {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: FuncUtilities.season.length,
      itemBuilder: (context, index) =>
          _itemSeasonWidget(FuncUtilities.season[index]),
      separatorBuilder: (context, index) =>
          Container(height: 1, width: double.infinity, color: black),
    );
  }

  Widget _itemSeasonWidget(String? season) {
    return InkWell(
      onTap: () => context.router.pop(season),
      child: Container(
        alignment: Alignment.centerLeft,
        height: kToolbarHeight,
        width: double.infinity,
        child: Text(season!),
      ),
    );
  }

  void _showBottomSheet() async {
    String? result = await showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        builder: (_) {
          return _listSeason;
        });

    if (result != null) {
      _detailStore?.selectSeason(widget.leagueId!, selectedSeason: result);
    }
  }
}
