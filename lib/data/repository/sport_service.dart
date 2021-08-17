import 'package:sport_app_example/data/constant/const_variable.dart';
import 'package:sport_app_example/data/network_configuration/base_service_dio.dart';
import 'package:sport_app_example/data/network_configuration/service_url.dart';
import 'package:sport_app_example/data/remote/response/country_response/country_response.dart';
import 'package:sport_app_example/data/remote/response/league_response/league_response.dart';
import 'package:sport_app_example/data/remote/response/team_response/team_response.dart';

class SportService extends BaseServiceDio {
  Future<CountryResponse> fetchAllCountry() async {
    try {
      Map<String, dynamic> queryParameter = Map();

      final response = await service.get(ServiceUrl.country,
          queryParameters: queryParameter);

      return CountryResponse.fromJson(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<LeagueResponse> fetchLeagueInCountry({String? country}) async {
    try {
      Map<String, dynamic> queryParameter = Map();
      queryParameter.putIfAbsent("c", () => country ?? default_country);
      queryParameter.putIfAbsent("s", () => sport_category);

      final response = await service.get(ServiceUrl.leaguesByCountry,
          queryParameters: queryParameter);

      return LeagueResponse.fromJson(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<TeamResponse> fetchTeamsInCountry({String? country}) async {
    try {
      Map<String, dynamic> queryParameter = Map();
      queryParameter.putIfAbsent("c", () => country ?? default_country);
      queryParameter.putIfAbsent("s", () => sport_category);

      final response =
          await service.get(ServiceUrl.teams, queryParameters: queryParameter);

      return TeamResponse.fromJson(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<TeamResponse> fetchTeamsInLeague({String? league}) async {
    try {
      Map<String, dynamic> queryParameter = Map();
      queryParameter.putIfAbsent("l", () => league);

      final response =
          await service.get(ServiceUrl.teams, queryParameters: queryParameter);

      return TeamResponse.fromJson(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<TeamResponse> searchTeamByName({String? name}) async{
    try {
      Map<String, dynamic> queryParameter = Map();
      queryParameter.putIfAbsent("t", () => name);

      final response =
      await service.get(ServiceUrl.searchTeam, queryParameters: queryParameter);

      return TeamResponse.fromJson(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
