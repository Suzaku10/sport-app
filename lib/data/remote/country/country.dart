import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country extends Equatable {
  @JsonKey(name: "name_en")
  final String? nameEn;

  Country({this.nameEn});

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  @override
  List<Object?> get props => [nameEn];
}
