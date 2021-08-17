class ServiceUrl {
  ServiceUrl._();

  static String get _version => "v1";

  static String get _format => "json/1";

  static String get country => "$_version/$_format/all_countries.php";

  static String get teams => "$_version/$_format/search_all_teams.php";

  static String get searchTeam => "$_version/$_format/searchteams.php";

  static String get leagueDetail => "$_version/$_format/eventsseason.php";

  static String get leaguesByCountry =>
      "$_version/$_format/search_all_leagues.php";
}
