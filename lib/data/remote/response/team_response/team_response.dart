import 'package:json_annotation/json_annotation.dart';
import 'package:sport_app_example/data/remote/team/team.dart';

part 'team_response.g.dart';

@JsonSerializable()
class TeamResponse {
  final List<Team>? teams;

  TeamResponse({this.teams});

  factory TeamResponse.fromJson(Map<String, dynamic> json) =>
      _$TeamResponseFromJson(json);
}
