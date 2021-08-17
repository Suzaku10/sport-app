// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeagueResponse _$LeagueResponseFromJson(Map<String, dynamic> json) {
  return LeagueResponse(
    (json['countrys'] as List<dynamic>?)
        ?.map((e) => League.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LeagueResponseToJson(LeagueResponse instance) =>
    <String, dynamic>{
      'countrys': instance.countrys,
    };
