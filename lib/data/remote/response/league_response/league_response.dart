import 'package:json_annotation/json_annotation.dart';
import 'package:sport_app_example/data/remote/league/league.dart';

part 'league_response.g.dart';

@JsonSerializable()
class LeagueResponse {
  final List<League>? countrys;

  LeagueResponse(this.countrys);

  factory LeagueResponse.fromJson(Map<String, dynamic> json) =>
      _$LeagueResponseFromJson(json);
}
