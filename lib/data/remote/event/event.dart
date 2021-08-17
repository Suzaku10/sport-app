import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  final String? idEvent;
  final String? idSoccerXML;
  final String? idAPIfootball;
  final String? strEvent;
  final String? strEventAlternate;
  final String? strFilename;
  final String? strSport;
  final String? idLeague;
  final String? strLeague;
  final String? strSeason;
  final String? strDescriptionEN;
  final String? strHomeTeam;
  final String? strAwayTeam;
  final String? intHomeScore;
  final String? intRound;
  final String? intAwayScore;
  final String? intSpectators;
  final String? strOfficial;
  final String? strHomeGoalDetails;
  final String? strHomeRedCards;
  final String? strHomeYellowCards;
  final String? strHomeLineupGoalkeeper;
  final String? strHomeLineupDefense;
  final String? strHomeLineupMidfield;
  final String? strHomeLineupForward;
  final String? strHomeLineupSubstitutes;
  final String? strHomeFormation;
  final String? strAwayRedCards;
  final String? strAwayYellowCards;
  final String? strAwayGoalDetails;
  final String? strAwayLineupGoalkeeper;
  final String? strAwayLineupDefense;
  final String? strAwayLineupMidfield;
  final String? strAwayLineupForward;
  final String? strAwayLineupSubstitutes;
  final String? strAwayFormation;
  final String? intHomeShots;
  final String? intAwayShots;
  final String? strTimestamp;
  final String? dateEvent;
  final String? dateEventLocal;
  final String? strTime;
  final String? strTimeLocal;
  final String? strTVStation;
  final String? idHomeTeam;
  final String? idAwayTeam;
  final String? strResult;
  final String? strVenue;
  final String? strCountry;
  final String? strCity;
  final String? strPoster;
  final String? strSquare;
  final String? strFanart;
  final String? strThumb;
  final String? strBanner;
  final String? strMap;
  final String? strTweet1;
  final String? strTweet2;
  final String? strTweet3;
  final String? strVideo;
  final String? strStatus;
  final String? strPostponed;
  final String? strLocked;

  Event(
      {this.idEvent,
      this.idSoccerXML,
      this.idAPIfootball,
      this.strEvent,
      this.strEventAlternate,
      this.strFilename,
      this.strSport,
      this.idLeague,
      this.strLeague,
      this.strSeason,
      this.strDescriptionEN,
      this.strHomeTeam,
      this.strAwayTeam,
      this.intHomeScore,
      this.intRound,
      this.intAwayScore,
      this.intSpectators,
      this.strOfficial,
      this.strHomeGoalDetails,
      this.strHomeRedCards,
      this.strHomeYellowCards,
      this.strHomeLineupGoalkeeper,
      this.strHomeLineupDefense,
      this.strHomeLineupMidfield,
      this.strHomeLineupForward,
      this.strHomeLineupSubstitutes,
      this.strHomeFormation,
      this.strAwayRedCards,
      this.strAwayYellowCards,
      this.strAwayGoalDetails,
      this.strAwayLineupGoalkeeper,
      this.strAwayLineupDefense,
      this.strAwayLineupMidfield,
      this.strAwayLineupForward,
      this.strAwayLineupSubstitutes,
      this.strAwayFormation,
      this.intHomeShots,
      this.intAwayShots,
      this.strTimestamp,
      this.dateEvent,
      this.dateEventLocal,
      this.strTime,
      this.strTimeLocal,
      this.strTVStation,
      this.idHomeTeam,
      this.idAwayTeam,
      this.strResult,
      this.strVenue,
      this.strCountry,
      this.strCity,
      this.strPoster,
      this.strSquare,
      this.strFanart,
      this.strThumb,
      this.strBanner,
      this.strMap,
      this.strTweet1,
      this.strTweet2,
      this.strTweet3,
      this.strVideo,
      this.strStatus,
      this.strPostponed,
      this.strLocked});

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
