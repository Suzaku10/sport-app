import 'package:sport_app_example/data/remote/response/country_response/country_response.dart';
import 'package:sport_app_example/data/remote/response/league_response/league_response.dart';
import 'package:sport_app_example/data/remote/response/team_response/team_response.dart';
import 'package:sport_app_example/data/repository/sport_service.dart';

abstract class SportRepository {
  Future<CountryResponse> fetchAllCountry();

  Future<TeamResponse> fetchTeamsByCountry({String? country});

  Future<LeagueResponse> fetchLeaguesInCountry({String? country});

  Future<TeamResponse> fetchTeamsByLeague({String? league});
}

class SportRepositoryImpl extends SportRepository {
  SportService _service = SportService();

  @override
  Future<CountryResponse> fetchAllCountry() async {
    return await _service.fetchAllCountry();
  }

  @override
  Future<LeagueResponse> fetchLeaguesInCountry({String? country}) async {
    return await _service.fetchLeagueInCountry(country: country);
  }

  @override
  Future<TeamResponse> fetchTeamsByCountry({String? country}) async {
    return await _service.fetchTeamsInCountry(country: country);
  }

  @override
  Future<TeamResponse> fetchTeamsByLeague({String? league}) async {
    return await _service.fetchTeamsInLeague(league: league);
  }
}
