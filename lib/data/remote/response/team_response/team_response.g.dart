// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamResponse _$TeamResponseFromJson(Map<String, dynamic> json) {
  return TeamResponse(
    teams: (json['teams'] as List<dynamic>?)
        ?.map((e) => Team.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TeamResponseToJson(TeamResponse instance) =>
    <String, dynamic>{
      'teams': instance.teams,
    };
