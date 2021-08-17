import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sport_app_example/material/generic_scaffold.dart';

class LeagueDetailPage extends StatefulWidget {
  final String? leagueId;

  const LeagueDetailPage({@PathParam('leagueId') this.leagueId});

  @override
  _LeagueDetailPageState createState() => _LeagueDetailPageState();
}

class _LeagueDetailPageState extends State<LeagueDetailPage> {
  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      appBar: AppBar(
        title: Text("League Detail"),
      ),
      body: Container(),
    );
  }
}
