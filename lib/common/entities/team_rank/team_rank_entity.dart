import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/team_rank_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/team_rank_entity.g.dart';

@JsonSerializable()
class TeamRankEntity {
  @JSONField(name: "OppPointsPG")
  late double oppPointsPG;
  @JSONField(name: "Oct")
  late String oct = '';
  @JSONField(name: "Apr")
  late String apr = '';
  @JSONField(name: "DivisionRank")
  late int divisionRank = 0;
  @JSONField(name: "LeagueRank")
  late int leagueRank = 0;
  @JSONField(name: "ROAD")
  late String rOAD = '';
  late String strCurrentHomeStreak = '';
  @JSONField(name: "DiffTotalPoints")
  late int diffTotalPoints = 0;
  late String strLongHomeStreak = '';
  @JSONField(name: "Last10Road")
  late String last10Road = '';
  @JSONField(name: "AheadAtThird")
  late String aheadAtThird = '';
  late String vsEast = '';
  @JSONField(name: "Conference")
  late String conference = '';
  @JSONField(name: "BehindAtHalf")
  late String behindAtHalf = '';
  @JSONField(name: "TotalPoints")
  late int totalPoints = 0;
  @JSONField(name: "PlayoffRank")
  late int playoffRank = 0;
  @JSONField(name: "TenPTSOrMore")
  late String tenPTSOrMore = '';
  @JSONField(name: "EliminatedConference")
  late int eliminatedConference = 0;
  @JSONField(name: "Score_80_Plus")
  late String score80Plus = '';
  @JSONField(name: "ConferenceRecord")
  late String conferenceRecord = '';
  @JSONField(name: "PointsPG")
  late double pointsPG;
  @JSONField(name: "CurrentRoadStreak")
  late int currentRoadStreak = 0;
  @JSONField(name: "Score100PTS")
  late String score100PTS = '';
  @JSONField(name: "OppTotalPoints")
  late int oppTotalPoints = 0;
  @JSONField(name: "NEUTRAL")
  late String nEUTRAL = '';
  @JSONField(name: "AheadAtHalf")
  late String aheadAtHalf = '';
  @JSONField(name: "LOSSES")
  late int lOSSES = 0;
  late String strLongRoadStreak = '';
  @JSONField(name: "ClinchedPlayoffBirth")
  late int clinchedPlayoffBirth = 0;
  @JSONField(name: "ClinchIndicator")
  late String clinchIndicator = '';
  @JSONField(name: "LeadInFGPCT")
  late String leadInFGPCT = '';
  @JSONField(name: "Opp_Score_Below_80")
  late String oppScoreBelow80 = '';
  late String strCurrentRoadStreak = '';
  late String strCurrentStreak = '';
  @JSONField(name: "TeamSlug")
  late String teamSlug = '';
  @JSONField(name: "ClinchedPostSeason")
  late int clinchedPostSeason = 0;
  @JSONField(name: "ConferenceGamesBack")
  late double conferenceGamesBack;
  @JSONField(name: "Nov")
  late String nov = '';
  @JSONField(name: "ClinchedDivisionTitle")
  late int clinchedDivisionTitle = 0;
  @JSONField(name: "TiedAtThird")
  late String tiedAtThird = '';
  late String vsNorthwest = '';
  @JSONField(name: "PlayoffSeeding")
  late int playoffSeeding = 0;
  @JSONField(name: "SeasonID")
  late String seasonID = '';
  @JSONField(name: "LeagueID")
  late String leagueID = '';
  @JSONField(name: "LongWinStreak")
  late int longWinStreak = 0;
  @JSONField(name: "LongHomeStreak")
  late int longHomeStreak = 0;
  @JSONField(name: "WINS")
  late int wINS = 0;
  @JSONField(name: "Mar")
  late String mar = '';
  @JSONField(name: "BehindAtThird")
  late String behindAtThird = '';
  @JSONField(name: "Score_Below_80")
  late String scoreBelow80 = '';
  late String vsSoutheast = '';
  late String vsPacific = '';
  late String vsAtlantic = '';
  @JSONField(name: "TeamName")
  late String teamName = '';
  @JSONField(name: "TeamID")
  late int teamID = 0;
  @JSONField(name: "Last10Home")
  late String last10Home = '';
  @JSONField(name: "LeadInReb")
  late String leadInReb = '';
  @JSONField(name: "EliminatedDivision")
  late int eliminatedDivision = 0;
  @JSONField(name: "LongRoadStreak")
  late int longRoadStreak = 0;
  late String vsWest = '';
  @JSONField(name: "TeamCity")
  late String teamCity = '';
  @JSONField(name: "OppOver500")
  late String oppOver500 = '';
  @JSONField(name: "Division")
  late String division = '';
  @JSONField(name: "Record")
  late String record = '';
  @JSONField(name: "ClinchedPlayIn")
  late int clinchedPlayIn = 0;
  @JSONField(name: "LeagueGamesBack")
  late double leagueGamesBack;
  @JSONField(name: "DivisionGamesBack")
  late double divisionGamesBack;
  @JSONField(name: "FewerTurnovers")
  late String fewerTurnovers = '';
  @JSONField(name: "DivisionRecord")
  late String divisionRecord = '';
  @JSONField(name: "CurrentStreak")
  late int currentStreak = 0;
  @JSONField(name: "Feb")
  late String feb = '';
  @JSONField(name: "Dec")
  late String dec = '';
  @JSONField(name: "OT")
  late String oT = '';
  @JSONField(name: "OppScore100PTS")
  late String oppScore100PTS = '';
  late String vsSouthwest = '';
  @JSONField(name: "ClinchedConferenceTitle")
  late int clinchedConferenceTitle = 0;
  late String vsCentral = '';
  @JSONField(name: "L10")
  late String l10 = '';
  @JSONField(name: "Opp_Score_80_Plus")
  late String oppScore80Plus = '';
  @JSONField(name: "WinPCT")
  late double winPCT;
  @JSONField(name: "LongLossStreak")
  late int longLossStreak = 0;
  @JSONField(name: "CurrentHomeStreak")
  late int currentHomeStreak = 0;
  @JSONField(name: "Jan")
  late String jan = '';
  @JSONField(name: "DiffPointsPG")
  late double diffPointsPG;
  @JSONField(name: "ThreePTSOrLess")
  late String threePTSOrLess = '';
  @JSONField(name: "TiedAtHalf")
  late String tiedAtHalf = '';
  @JSONField(name: "HOME")
  late String hOME = '';
  late String shortEname;
  late int force = 0;

  TeamRankEntity();

  factory TeamRankEntity.fromJson(Map<String, dynamic> json) =>
      $TeamRankEntityFromJson(json);

  Map<String, dynamic> toJson() => $TeamRankEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
