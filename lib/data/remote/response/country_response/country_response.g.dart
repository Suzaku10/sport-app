// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryResponse _$CountryResponseFromJson(Map<String, dynamic> json) {
  return CountryResponse(
    countries: (json['countries'] as List<dynamic>?)
        ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CountryResponseToJson(CountryResponse instance) =>
    <String, dynamic>{
      'countries': instance.countries,
    };
