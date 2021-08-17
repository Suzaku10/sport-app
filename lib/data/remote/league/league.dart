import 'package:json_annotation/json_annotation.dart';

part 'league.g.dart';

@JsonSerializable()
class League {
  final String? idLeague;
  final String? idSoccerXML;
  final String? strSport;
  final String? strLeague;
  final String? strLeagueAlternate;
  final String? strDivision;
  final String? idCup;
  final String? strCurrentSeason;
  final String? intFormedYear;
  final String? dateFirstEvent;
  final String? strGender;
  final String? strCountry;
  final String? strWebsite;
  final String? strFacebook;
  final String? strTwitter;
  final String? strYoutube;
  final String? strRSS;
  final String? strDescriptionEN;
  final String? strDescriptionDE;
  final String? strDescriptionFR;
  final String? strDescriptionIT;
  final String? strDescriptionCN;
  final String? strDescriptionJP;
  final String? strDescriptionRU;
  final String? strDescriptionES;
  final String? strDescriptionPT;
  final String? strDescriptionSE;
  final String? strDescriptionNL;
  final String? strDescriptionHU;
  final String? strDescriptionNO;
  final String? strDescriptionPL;
  final String? strTvRights;
  final String? strFanart1;
  final String? strFanart2;
  final String? strFanart3;
  final String? strFanart4;
  final String? strBanner;
  final String? strBadge;
  final String? strLogo;
  final String? strPoster;
  final String? strTrophy;
  final String? strComplete;
  final String? strLocked;

  League(
      {this.idLeague,
      this.idSoccerXML,
      this.strSport,
      this.strLeague,
      this.strLeagueAlternate,
      this.strDivision,
      this.idCup,
      this.strCurrentSeason,
      this.intFormedYear,
      this.dateFirstEvent,
      this.strGender,
      this.strCountry,
      this.strWebsite,
      this.strFacebook,
      this.strTwitter,
      this.strYoutube,
      this.strRSS,
      this.strDescriptionEN,
      this.strDescriptionDE,
      this.strDescriptionFR,
      this.strDescriptionIT,
      this.strDescriptionCN,
      this.strDescriptionJP,
      this.strDescriptionRU,
      this.strDescriptionES,
      this.strDescriptionPT,
      this.strDescriptionSE,
      this.strDescriptionNL,
      this.strDescriptionHU,
      this.strDescriptionNO,
      this.strDescriptionPL,
      this.strTvRights,
      this.strFanart1,
      this.strFanart2,
      this.strFanart3,
      this.strFanart4,
      this.strBanner,
      this.strBadge,
      this.strLogo,
      this.strPoster,
      this.strTrophy,
      this.strComplete,
      this.strLocked});

  factory League.fromJson(Map<String, dynamic> json) =>
      _$LeagueFromJson(json);
}
