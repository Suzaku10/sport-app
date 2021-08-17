import 'package:json_annotation/json_annotation.dart';

part 'team.g.dart';

@JsonSerializable()
class Team {
  final String? idTeam;
  final String? idSoccerXML;
  final String? idAPIfootball;
  final String? intLoved;
  final String? strTeam;
  final String? strTeamShort;
  final String? strAlternate;
  final String? intFormedYear;
  final String? strSport;
  final String? strLeague;
  final String? idLeague;
  final String? strLeague2;
  final String? idLeague2;
  final String? strLeague3;
  final String? idLeague3;
  final String? strLeague4;
  final String? idLeague4;
  final String? strLeague5;
  final String? idLeague5;
  final String? strLeague6;
  final String? idLeague6;
  final String? strLeague7;
  final String? idLeague7;
  final String? strDivision;
  final String? strManager;
  final String? strStadium;
  final String? strKeywords;
  final String? strRSS;
  final String? strStadiumThumb;
  final String? strStadiumDescription;
  final String? strStadiumLocation;
  final String? intStadiumCapacity;
  final String? strWebsite;
  final String? strFacebook;
  final String? strTwitter;
  final String? strInstagram;
  final String? strDescriptionEN;
  final String? strDescriptionDE;
  final String? strDescriptionFR;
  final String? strDescriptionCN;
  final String? strDescriptionIT;
  final String? strDescriptionJP;
  final String? strDescriptionRU;
  final String? strDescriptionES;
  final String? strDescriptionPT;
  final String? strDescriptionSE;
  final String? strDescriptionNL;
  final String? strDescriptionHU;
  final String? strDescriptionNO;
  final String? strDescriptionIL;
  final String? strDescriptionPL;
  final String? strGender;
  final String? strCountry;
  final String? strTeamBadge;
  final String? strTeamJersey;
  final String? strTeamLogo;
  final String? strTeamFanart1;
  final String? strTeamFanart2;
  final String? strTeamFanart3;
  final String? strTeamFanart4;
  final String? strTeamBanner;
  final String? strYoutube;
  final String? strLocked;

  Team(
      {this.idTeam,
      this.idSoccerXML,
      this.idAPIfootball,
      this.intLoved,
      this.strTeam,
      this.strTeamShort,
      this.strAlternate,
      this.intFormedYear,
      this.strSport,
      this.strLeague,
      this.idLeague,
      this.strLeague2,
      this.idLeague2,
      this.strLeague3,
      this.idLeague3,
      this.strLeague4,
      this.idLeague4,
      this.strLeague5,
      this.idLeague5,
      this.strLeague6,
      this.idLeague6,
      this.strLeague7,
      this.idLeague7,
      this.strDivision,
      this.strManager,
      this.strStadium,
      this.strKeywords,
      this.strRSS,
      this.strStadiumThumb,
      this.strStadiumDescription,
      this.strStadiumLocation,
      this.intStadiumCapacity,
      this.strWebsite,
      this.strFacebook,
      this.strTwitter,
      this.strInstagram,
      this.strDescriptionEN,
      this.strDescriptionDE,
      this.strDescriptionFR,
      this.strDescriptionCN,
      this.strDescriptionIT,
      this.strDescriptionJP,
      this.strDescriptionRU,
      this.strDescriptionES,
      this.strDescriptionPT,
      this.strDescriptionSE,
      this.strDescriptionNL,
      this.strDescriptionHU,
      this.strDescriptionNO,
      this.strDescriptionIL,
      this.strDescriptionPL,
      this.strGender,
      this.strCountry,
      this.strTeamBadge,
      this.strTeamJersey,
      this.strTeamLogo,
      this.strTeamFanart1,
      this.strTeamFanart2,
      this.strTeamFanart3,
      this.strTeamFanart4,
      this.strTeamBanner,
      this.strYoutube,
      this.strLocked});

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}
