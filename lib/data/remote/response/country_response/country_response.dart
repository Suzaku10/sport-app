import 'package:json_annotation/json_annotation.dart';
import 'package:sport_app_example/data/remote/country/country.dart';

part 'country_response.g.dart';

@JsonSerializable()
class CountryResponse {
  final List<Country>? countries;

  CountryResponse({this.countries});

  factory CountryResponse.fromJson(Map<String, dynamic> json) =>
      _$CountryResponseFromJson(json);
}
